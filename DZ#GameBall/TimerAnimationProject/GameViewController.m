//
//  ViewController.m
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 25/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "GameViewController.h"
#import "GRPBallView.h"
#import "UserLaneView.h"
#import "ComputerLaneView.h"

@interface GameViewController ()

@property (nonatomic,strong) GRPBallView *ballView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) CGFloat deltaX;
@property (nonatomic,assign) CGFloat deltaY;
@property (nonatomic,strong) UserLaneView *userLaneView;
@property (nonatomic,strong) ComputerLaneView *computerLaneView;
@property (nonatomic,assign) NSNumber *userPoint;
@property (nonatomic,assign) NSNumber *computerPoint;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self setUpModel];
    [self setUpTimer];
}

-(void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - SetUp

- (void) setUpUI
{
    self.userPoint = @(0);
    self.computerPoint = @(0);
    self.navigationItem.title = [NSString stringWithFormat: @"User %@ : %@ Computer",self.userPoint,self.computerPoint ];

    self.view.backgroundColor = UIColor.whiteColor;
    self.ballView = [[GRPBallView alloc] initWIthRadius:20.0f andColor:[UIColor redColor]];
    [self.view addSubview:self.ballView];
    
    self.userLaneView = [[UserLaneView alloc] initWithHeight:30 width:160];
    [self.view addSubview:self.userLaneView];
    
    self.computerLaneView = [[ComputerLaneView alloc] initWithHeight:30 width:160];
    [self.view addSubview:self.computerLaneView];
    
    UISwipeGestureRecognizer *swipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:nil];
    swipeRec.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeRec];
    
}

- (void)setUpTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
    self.timer.tolerance = 0.01; //чтобы не грузить процессор
}

#pragma mark - Logic

- (void) timerTick
{
    
    [self checkWorldState];
    
    self.ballView.center = CGPointMake(self.ballView.center.x + self.deltaX, self.ballView.center.y + self.deltaY);
    [self.computerLaneView setCenterFromBall:self.ballView.center.x];
}

- (void) setUpModel
{
    self.deltaX = -10;
    self.deltaY = 5;
}

- (void)checkWorldState
{
    CGFloat rightBallCoordX = self.ballView.center.x + self.ballView.ballRadius;
    if (rightBallCoordX + self.deltaX >= CGRectGetWidth(self.view.frame))
    {
        self.deltaX = -self.deltaX;
    }
    
    CGFloat leftBallCoordX = self.ballView.center.x - self.ballView.ballRadius;
    if (leftBallCoordX + self.deltaX <= 0)
    {
        self.deltaX = -self.deltaX;
    }
    CGFloat topBallCoordY = self.ballView.center.y - self.ballView.ballRadius;
    CGFloat bottomBallCoordY = self.ballView.center.y + self.ballView.ballRadius;
    
    if ((topBallCoordY + self.deltaY <= CGRectGetMaxY(self.computerLaneView.frame)) && ((CGRectGetMinX(self.ballView.frame) < CGRectGetMaxX(self.computerLaneView.frame)) && (CGRectGetMaxX(self.ballView.frame) > CGRectGetMinX(self.computerLaneView.frame))))
    {
        self.deltaY = -self.deltaY;
    }
    if ((bottomBallCoordY + self.deltaY >= CGRectGetMinY(self.userLaneView.frame)) &&  ((CGRectGetMinX(self.ballView.frame) < CGRectGetMaxX(self.userLaneView.frame)) && (CGRectGetMaxX(self.ballView.frame) > CGRectGetMinX(self.userLaneView.frame)))) {
        self.deltaY = -self.deltaY;
    }
    
    
    
    if (bottomBallCoordY + self.deltaY >= CGRectGetHeight(self.view.frame))
    {
        [self.ballView setCenter: self.view.center];
        self.computerPoint = [NSNumber numberWithInt:self.computerPoint.intValue + 1];
        self.navigationItem.title = [NSString stringWithFormat: @"User %@ : %@ Computer",self.userPoint,self.computerPoint ];
        
    }
    
    if (topBallCoordY <= 0)
    {
        [self.ballView setCenter: self.view.center];
        self.userPoint = [NSNumber numberWithInt:self.userPoint.intValue + 1];
        self.navigationItem.title = [NSString stringWithFormat: @"User %@ : %@ Computer",self.userPoint,self.computerPoint ];
    }

//
//    CGFloat bottomBallCoordY = self.ballView.center.y + self.ballView.ballRadius;
//    if (bottomBallCoordY + self.deltaY >= CGRectGetHeight(self.view.frame))
//    {
//        self.deltaY = -self.deltaY;
//    }
//    CGFloat topBallCoordY = self.ballView.center.y - self.ballView.ballRadius;
//    if (topBallCoordY <= 0)
//    {
//        self.deltaY = -self.deltaY;
//    }

}

@end
