//
//  ViewController.m
//  ViewTest123123
//
//  Created by Alexey Levanov on 18/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "ViewController.h"
#import "ComplicatedView.h"

const CGFloat viewWidth = 200;
const CGFloat viewHeight = 50;

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	NSLog(@"View загружена");
	[self prepareUI];
	[self deleteLabels];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	//NSLog(@"View появится");
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	//NSLog(@"View появилась");
}


#pragma mark - UI

- (void)prepareUI
{
//    UIView *someView = [[UIView alloc] initWithFrame:CGRectMake(20, 50, viewWidth, viewHeight)];
//    someView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:someView];
//
//    UIView *secondView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    secondView.center=self.view.center;
//    secondView.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:secondView];
//    
//    UILabel *someLabel = [[UILabel alloc] initWithFrame:someView.frame];
//    someLabel.text=@"Hello world";
//    [self.view addSubview:someLabel];
//
//    [self.view bringSubviewToFront:someView];
//    
//    UILabel *anotherLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.,( self.view.frame.size.height- 200)/2., 200, 200)];
//    anotherLabel.text = @"Another label";
//    anotherLabel.font = [UIFont systemFontOfSize:25.0];
//    anotherLabel.textAlignment = NSTextAlignmentCenter;
//
////    [self.view addSubview:anotherLabel];
//    [self.view insertSubview:anotherLabel belowSubview:secondView];
	
	ComplicatedView* complicatedView = [[ComplicatedView alloc] initWithFrame:CGRectMake(60, 60, 220, 70)];
	[self.view addSubview:complicatedView];
    
    UISwipeGestureRecognizer *swipeRec = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(recognizerWorked:)];
    swipeRec.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeRec];
	
}
-(void)recognizerWorked:(UIGestureRecognizer *)recognizer
{
    NSLog(@"regognizer worked");
}
- (void)deleteLabels
{
	for (UIView *view in self.view.subviews)
	{
		if ([view isKindOfClass:[UILabel class]])
		{
			[view removeFromSuperview];
		}
			
	}
}

#pragma mark - UIResponder

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
	
	//NSLog(@"Touches Began at: %f %f", coordinatesOfTouch.x, coordinatesOfTouch.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
	//NSLog(@"Touches Moved at: %f %f", coordinatesOfTouch.x, coordinatesOfTouch.y);

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	CGPoint coordinatesOfTouch = [self pointForCurrentViewWithTouch:touches];
	//NSLog(@"Touches Ended at: %f %f", coordinatesOfTouch.x, coordinatesOfTouch.y);

}

- (CGPoint)pointForCurrentViewWithTouch:(NSSet<UITouch *> *)touches
{
	UITouch *currentTouch = touches.anyObject;
	return [currentTouch locationInView:self.view];
}

@end
