//
//  CustomTableViewCell.h
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOIndex.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Кастомная ячейка для таблицы
 */
@interface CustomTableViewCell : UITableViewCell

/**
 Метка для отображения индекса объекта
 */
@property (nonatomic,readonly) UILabel *label;

/**
 Метод для выставления индекса объекта в метку ячейки

 @param object объект из CoreData
 */
- (void)configureWithObject:(MOIndex *)object;

@end

NS_ASSUME_NONNULL_END
