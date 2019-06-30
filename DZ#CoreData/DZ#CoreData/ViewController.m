//
//  ViewController.m
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataStack.h"
#import "MOIndex.h"
#import "CustomTableViewCell.h"
@import CoreData;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSFetchedResultsController *resultController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self read];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //[self write];

}

- (void) write
{
    [[CoreDataStack shared].container performBackgroundTask:^(NSManagedObjectContext * _Nonnull context) {
        
        for (NSInteger index = 0; index < 1000; index ++)
        {
            MOIndex *object = [[MOIndex alloc] initWithContext:context];
            object.index = index;
            NSLog(@"%ld",(long)index);
        }
        [context save:nil];
        NSLog(@"Done!");
    }];
}

- (void) read
{
    NSManagedObjectContext *viewContext = [CoreDataStack shared].container.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Index"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"index" ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    self.resultController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:viewContext sectionNameKeyPath:nil cacheName:nil];
    
    [self.resultController performFetch:nil];

}

- (void)configureCell:(CustomTableViewCell *)cell withObject:(MOIndex *)object {
    cell.label.text = [[NSString alloc] initWithFormat:@"index : %li",object.index];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultController sections][section].numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"id"];
    
    MOIndex *object = [self.resultController objectAtIndexPath:indexPath];
    
    [self configureCell:cell withObject:object];
    return cell;
}


@end
