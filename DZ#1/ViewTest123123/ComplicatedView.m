//
//  ComplicatedView.m
//  ViewTest123123
//
//  Created by Alexey Levanov on 18/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "ComplicatedView.h"

@implementation ComplicatedView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		self.backgroundColor = [UIColor greenColor];
	}
    NSLog(@"координата Х: %f, координата У: %f",self.frame.origin.x,self.frame.origin.y);
	return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	//CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
    CGPoint coordinatesOfTouchInSuperView = [touches.allObjects.firstObject locationInView:self.superview];
    
    self.deltaX = (coordinatesOfTouchInSuperView.x - self.frame.origin.x);
    self.deltaY = (coordinatesOfTouchInSuperView.y - self.frame.origin.y);
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinatesOfTouchInSuperView = [touches.allObjects.firstObject locationInView:self.superview];

    [self setFrame:CGRectMake(coordinatesOfTouchInSuperView.x - self.deltaX, coordinatesOfTouchInSuperView.y - self.deltaY, self.frame.size.width, self.frame.size.height)];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
	//NSLog(@"Я завершил жест внутри вьюшки и получил ЭТО: %f %f", coordinatesOfTouch.x, coordinatesOfTouch.y);
	
}

- (CGPoint)pointForCurrentViewWithTouch:(NSSet<UITouch *> *)touches
{
	UITouch *currentTouch = touches.anyObject;
	return [currentTouch locationInView:self];
}

@end
