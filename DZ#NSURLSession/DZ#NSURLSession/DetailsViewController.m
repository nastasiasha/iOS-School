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
    [self.imageView.heightAnchor constraintEqualToConstant:500].active = YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.guide.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.guide.rightAnchor].active = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationItem.hidesBackButton = NO;
}

@end
