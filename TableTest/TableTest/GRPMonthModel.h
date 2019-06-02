//
//  GRPMonthModel.h
//  TableTest
//
//  Created by Анастасия Шахлан on 28/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GRPMonthModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *descr;

-(instancetype)initWithName:(NSString *)name description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
