//
//  MOIndex.h
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN


/**
 Класс для CoreData
 */
@interface MOIndex : NSManagedObject

/**
 Поле, хранящее порядковый номер объекта
 */
@property (nonatomic,assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END
