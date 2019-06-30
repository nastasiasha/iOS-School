//
//  CoreDataStack.h
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

@property (nonatomic,strong) NSPersistentContainer *container;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
