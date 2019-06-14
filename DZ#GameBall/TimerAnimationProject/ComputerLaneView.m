//
//  ComputerLaneView.m
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 15/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ComputerLaneView.h"
@interface ComputerLaneView()

@property (nonatomic, assign) CGFloat deltaX;
@property (nonatomic, assign) CGFloat deltaY;

@end

@implementation ComputerLaneView

-(instancetype)initWithHeight:(CGFloat) height width: (CGFloat) width
{

    CGFloat coordinateX = CGRectGetMidX(UIScreen.mainScreen.bounds);
    CGFloat coordinateY = 3*height;
    self = [super initWithFrame:CGRectMake(coordinateX, coordinateY, width, height)];
    
    self.backgroundColor = UIColor.cyanColor;
    
    return self;
}

- (void) setCenterFromBall: (CGFloat)coordinate
{
    [self setCenter:CGPointMake(coordinate, self.center.y)];
}


@end
