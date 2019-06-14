//
//  LaneViewController.m
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 14/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "UserLaneView.h"

@interface UserLaneView ()

@property (nonatomic, assign) CGFloat deltaX;

@end

@implementation UserLaneView


-(instancetype)initWithHeight:(CGFloat) height width: (CGFloat) width
{
    CGFloat coordinateX = CGRectGetMidX(UIScreen.mainScreen.bounds);
    CGFloat coordinateY = CGRectGetHeight(UIScreen.mainScreen.bounds) - 2*height;

    self = [super initWithFrame:CGRectMake(coordinateX, coordinateY, width, height)];
    
    self.backgroundColor = UIColor.blueColor;
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
    CGPoint coordinatesOfTouchInSuperView = [touches.allObjects.firstObject locationInView:self.superview];
    
    self.deltaX = (coordinatesOfTouchInSuperView.x - self.frame.origin.x);
    //self.deltaY = (coordinatesOfTouchInSuperView.y - self.frame.origin.y);
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinatesOfTouchInSuperView = [touches.allObjects.firstObject locationInView:self.superview];
    
    [self setFrame:CGRectMake(coordinatesOfTouchInSuperView.x - self.deltaX,  CGRectGetMinY(self.frame), self.frame.size.width, self.frame.size.height)];
    
    
}


- (CGPoint)pointForCurrentViewWithTouch:(NSSet<UITouch *> *)touches
{
    UITouch *currentTouch = touches.anyObject;
    return [currentTouch locationInView:self];
}



@end
