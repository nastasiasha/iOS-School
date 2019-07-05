//
//  GRPFilterModel.m
//  AOGalleryProject
//
//  Created by admin on 08.06.2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "GRPFilterModel.h"
@interface GRPFilterModel()

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSDictionary <NSString *, id> *parameters;

@end

@implementation GRPFilterModel

-(instancetype)initWithName:(NSString *)name parameters:(NSDictionary<NSString *,id>*)parameters
{
    self.name = name;
    self.parameters = parameters;
    return self;
}

@end
