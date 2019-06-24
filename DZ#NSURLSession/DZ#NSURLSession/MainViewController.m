//
//  ViewController.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "MainViewController.h"
#import "PictureCell.h"
#import "NetworkService.h"
#import "NetworkServiceProtocol.h"
#import "DetailsViewController.h"

@interface MainViewController () <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, NetworkServiceOutputProtocol>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UILayoutGuide *guide;
@property (nonatomic, strong) NetworkService *networkService;
@property (nonatomic, strong) NSMutableArray<UIImage *> *arrayOfPictures;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfPictures = [[NSMutableArray alloc] initWithCapacity:count];
    [self initArrayOfPictures];
    //self.arrayOfPictures = [NSMutableArray arrayWithObjects:nil,nil,nil,nil,nil,nil, nil];
    
    [self setupUI];
    [self setupSearchBar];
    [self setupCollectionView];
    [self setupNetworkService];
}

- (void)initArrayOfPictures
{
    [self.arrayOfPictures removeAllObjects];
    NSNull *element = [NSNull null];
    for (NSInteger i = 0; i < count; i++)
    {
        [self.arrayOfPictures addObject:element];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void) setupUI
{
    self.view.backgroundColor = UIColor.whiteColor;
    self.guide = self.view.safeAreaLayoutGuide;
}

- (void) setupSearchBar
{
    self.searchBar = [UISearchBar new];
    [self.view addSubview:self.searchBar];
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.searchBar.topAnchor constraintEqualToAnchor:self.guide.topAnchor].active = YES;
    [self.searchBar.bottomAnchor constraintEqualToAnchor:self.guide.topAnchor constant:50].active = YES;
    [self.searchBar.leftAnchor constraintEqualToAnchor:self.guide.leftAnchor].active = YES;
    [self.searchBar.rightAnchor constraintEqualToAnchor:self.guide.rightAnchor].active = YES;
    
    self.searchBar.delegate = self;
}

- (void) setupCollectionView
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(175, 175);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:@"idCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView.topAnchor constraintEqualToAnchor:self.searchBar.bottomAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.guide.bottomAnchor].active = YES;
    [self.collectionView.rightAnchor constraintEqualToAnchor:self.searchBar.rightAnchor constant:-6].active = YES;
    [self.collectionView.leftAnchor constraintEqualToAnchor:self.searchBar.leftAnchor constant:6].active = YES;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
    self.collectionView.alpha = 0.0;
}

- (void) setupNetworkService
{
    self.networkService = [NetworkService new];
    self.networkService.output = self;
    [self.networkService configureUrlSessionWithParams:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self initArrayOfPictures];
    self.collectionView.alpha = 1.0;
    [self.collectionView reloadData];
    NSString *wordForSearch = [searchBar.text lowercaseString];
    [self.networkService findFlickrPhotoWithSearchString:wordForSearch];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return count;
    // self.imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    PictureCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"idCell" forIndexPath:indexPath];
//    if (cell.spinnerKey == YES)
//    {
//        [cell.spinner startAnimating];
//    } else {
//        [cell.spinner stopAnimating];
//    }
//    cell.spinnerKey = !cell.spinnerKey;
    
    UIImage *image = self.arrayOfPictures[indexPath.item];
    if (image != [NSNull null])
    {
        [UIView transitionWithView:cell.imageView
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                             [cell.imageView setImage:image];
                        } completion:nil];
       
        [cell.spinner stopAnimating];
    } else {
        [cell.spinner startAnimating];
        
    }
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PictureCell *cell = (PictureCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    if (cell.imageView.image != nil)
    {
        DetailsViewController *detailsVC = [DetailsViewController new];
        detailsVC.imageView = [UIImageView new];
        detailsVC.imageView.image = cell.imageView.image;
        [self.navigationController pushViewController:detailsVC animated:true];
        
    }
    
}

- (void)loadingIsDoneWithDataRecieved:(NSData *)dataRecieved
{
    UIImage *image = [UIImage imageWithData:dataRecieved];

    NSInteger i = [self.arrayOfPictures indexOfObject:[NSNull null]];
    [self.arrayOfPictures replaceObjectAtIndex:i withObject:image];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];

   
}



@end
