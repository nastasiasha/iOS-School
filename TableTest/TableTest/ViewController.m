//
//  ViewController.m
//  TableTest
//
//  Created by Анастасия Шахлан on 28/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ViewController.h"
#import "GRPCustomTableViewCell.h"
#import "GRPMonthModel.h"

static NSString * const GRPCustomTableViewCellIdentifier = @"GRPCustomTableViewCellIdentifier";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray<GRPMonthModel *> *models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[GRPCustomTableViewCell class] forCellReuseIdentifier:GRPCustomTableViewCellIdentifier];
    
    GRPMonthModel *january = [[GRPMonthModel alloc] initWithName:@"Январь" description:@"Очень холодно"];
    GRPMonthModel *february = [[GRPMonthModel alloc] initWithName:@"Февраль" description:@"Холодно"];
    GRPMonthModel *march = [[GRPMonthModel alloc] initWithName:@"Март" description:@"Еще прохладно"];
    GRPMonthModel *april = [[GRPMonthModel alloc] initWithName:@"Апрель" description:@"Нормально"];
    GRPMonthModel *may = [[GRPMonthModel alloc] initWithName:@"Май" description:@"Очень тепло"];
    self.models = @[january, february, march, april, may];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     GRPCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GRPCustomTableViewCellIdentifier forIndexPath:indexPath];
    
    GRPMonthModel *model = self.models[indexPath.row];
    
    cell.label.text = model.name;
    
//    if (indexPath.row % 2 == 0) {
//        cell.customView.image = [UIImage imageNamed:@"image01"];
//        cell.label.text = @"My text";
//    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@",self.models[indexPath.row].descr);
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    GRPMonthModel *june = [[GRPMonthModel alloc] initWithName:@"Июнь" description:@"Жарко"];
    
    NSMutableArray *array = [self.models mutableCopy];
    
    [tableView beginUpdates];
    
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.models.count inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    [array addObject:june];
    self.models = array;
    [tableView endUpdates];
    //[self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView beginUpdates];
        NSMutableArray *array = [self.models mutableCopy];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [array removeObjectAtIndex:indexPath.row];
        self.models = array;
        [tableView endUpdates];
    }
}

@end

//drawinrect


