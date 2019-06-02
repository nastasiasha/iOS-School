//
//  GRPMonthModel.m
//  TableTest
//
//  Created by Анастасия Шахлан on 28/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "GRPMonthModel.h"

@implementation GRPMonthModel
- (instancetype)initWithName:(NSString *)name description:(NSString *)description
{
    self = [super init];
    if (self)
    {
        _name = [name copy];
        _descr = [description copy];
    }
    return self;
}

@end
