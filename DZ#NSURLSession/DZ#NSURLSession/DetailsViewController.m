//
//  DetailsViewController.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (nonatomic,strong) UILayoutGuide *guide;

@end

@implementation DetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.guide = self.view.safeAreaLayoutGuide;
    
    [self.view addSubview:self.imageView];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.guide.topAnchor].active = YES;
    [self.imageView.heightAnchor constraintEqualToConstant: self.imageView.image.size.height].active = YES;
    [self.imageView.heightAnchor constraintLessThanOrEqualToConstant:500].active = YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.guide.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.guide.rightAnchor].active = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview: self.nameOfImage];
    self.nameOfImage.numberOfLines = 0;
    self.nameOfImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nameOfImage sizeToFit];
    
    [self.nameOfImage setCenter:CGPointMake(self.view.center.x, 0)];
    [self.nameOfImage.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor].active = YES;
    [self.nameOfImage.leftAnchor constraintEqualToAnchor:self.guide.leftAnchor constant:50].active = YES;
    [self.nameOfImage.rightAnchor constraintEqualToAnchor:self.guide.rightAnchor constant:-50].active = YES;
    self.nameOfImage.textAlignment = NSTextAlignmentCenter;
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationItem.hidesBackButton = NO;
}

@end
