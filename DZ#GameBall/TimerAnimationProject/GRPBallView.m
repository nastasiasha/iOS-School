//
//  GRPBallView.m
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 25/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "GRPBallView.h"



@interface GRPBallView()

@property (nonatomic,assign) CGFloat ballRadius;
@property (nonatomic,strong) UIColor *ballColor;

@end

@implementation GRPBallView

- (instancetype)initWIthRadius:(CGFloat)radius andColor:(UIColor *)color
{
    self = [super initWithFrame:CGRectMake(CGRectGetMidX(UIScreen.mainScreen.bounds), CGRectGetMidY(UIScreen.mainScreen.bounds), radius*2, radius*2)];
    if (self)
    {
        _ballRadius = radius;
        _ballColor = color;
        self.backgroundColor = _ballColor;
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
