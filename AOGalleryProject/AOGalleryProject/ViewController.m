//
//  ViewController.m
//  AOGalleryProject
//
//  Created by admin on 08.06.2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import "GRPFilterModel.h"
#import "FiltersFactory.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *imageFromPicker;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <GRPFilterModel *> *filters;
@property (nonatomic, strong) FiltersFactory *fabric;
@property (nonatomic, strong) CIContext *context;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonTapped)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Photo" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTapped)];
    [self setupImageView];
    [self setupTableView];
    
    self.fabric = [FiltersFactory new];
    self.filters = @[
                     [self.fabric createSepiaFilter],
                     [self.fabric createBoxBlurFilter],
                     [self.fabric createDiscBlurFilter],
                     [self.fabric createMedianBlurFilter],
                     [self.fabric createZoomBlurFilter]
                     ];
    self.context = [CIContext contextWithOptions:nil];
    self.imageFromPicker = [UIImage new];
}

-(void)setupTableView
{
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.tableView.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    
}

-(void)setupImageView
{
    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"default"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.imageView];
    [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
//    [self.imageView.widthAnchor constraintGreaterThanOrEqualToConstant:40].active = YES;
    [self.imageView.heightAnchor constraintEqualToConstant: self.imageView.image.size.height].active = YES;
    [self.imageView.heightAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor multiplier:1.0].active = YES;
    
}

-(void)leftButtonTapped
{
    //id obj = nil;
    if (!CGSizeEqualToSize(self.imageFromPicker.size,CGSizeZero))
    {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, nil, nil);
    } else {
        NSLog(@"default image");
    }
}

-(void)rightButtonTapped
{
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:type])
    {
        UIImagePickerController *controller = [UIImagePickerController new];
        controller.sourceType = type;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:type];
        [self.navigationController presentViewController:controller animated:YES completion:^{}];
        
        controller.delegate = self;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.imageFromPicker = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = self.imageFromPicker;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filters.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Фильтры";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    GRPFilterModel *model = self.filters[indexPath.row];
    
    cell.textLabel.text = model.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GRPFilterModel *filterModel = self.filters[indexPath.row];
    CGImageRef cgImage = self.imageFromPicker.CGImage;
    if (cgImage == nil)
    {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGImageRetain(cgImage);
        CIImage *beginImage = [CIImage imageWithCGImage: cgImage];
        
        CIContext *context = self.context;
        
        NSMutableDictionary<NSString *, id> *parameters = [filterModel.parameters mutableCopy];
        [parameters setObject:beginImage forKey:kCIInputImageKey];
        CIFilter *filter = [CIFilter filterWithName:filterModel.name withInputParameters:parameters];
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        
        UIImage *newImage = [UIImage imageWithCGImage:cgimg];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imageView.image = newImage;
            
            CGImageRelease(cgimg);
            CGImageRelease(cgImage);
            
        });
    });
    
}

@end
