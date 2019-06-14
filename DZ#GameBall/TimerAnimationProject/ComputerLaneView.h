//
//  ComputerLaneView.h
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 15/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComputerLaneView : UIView

- (instancetype)initWithHeight:(CGFloat) height width: (CGFloat) width;
- (void) setCenterFromBall: (CGFloat)coordinate;

@end

NS_ASSUME_NONNULL_END
