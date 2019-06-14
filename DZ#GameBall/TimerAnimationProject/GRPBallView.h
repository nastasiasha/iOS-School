//
//  GRPBallView.h
//  TimerAnimationProject
//
//  Created by Анастасия Шахлан on 25/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Класс-представление мяча
 */
@interface GRPBallView : UIView

@property (nonatomic,readonly) CGFloat ballRadius;
@property (nonatomic,readonly) UIColor *ballColor;

/**
 Создает эксземпляр класса с нужным радиусом и цветом

 @param radius радиус мяча
 @param color цвет
 @return радиус и цвет
 */
- (instancetype)initWIthRadius:(CGFloat)radius andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
