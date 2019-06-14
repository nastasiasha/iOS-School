//
//  MenuViewController.m
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 14/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()
@property (nonatomic,strong) UIButton *startGameButton;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
- (void)setupUI {
    
    self.startGameButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.startGameButton setTitle:@"Начать игру" forState:UIControlStateNormal];
    [self.startGameButton sizeToFit];
    [self.startGameButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    self.startGameButton.center = CGPointMake(CGRectGetMidX(UIScreen.mainScreen.bounds), CGRectGetMidY(UIScreen.mainScreen.bounds));
    [self.startGameButton addTarget:self action:@selector(openGame) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.startGameButton];
}
- (void)openGame
{
    GameViewController *vc = [GameViewController new];
    [self.navigationController pushViewController:vc animated:true];
}


@end
