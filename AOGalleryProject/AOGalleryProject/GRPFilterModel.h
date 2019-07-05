//
//  GRPFilterModel.h
//  AOGalleryProject
//
//  Created by admin on 08.06.2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRPFilterModel : NSObject

/**
 Имя для фильтра
 */
@property (nonatomic,readonly) NSString *name;

/**
 Параметры фильтра
 */
@property (nonatomic,readonly) NSDictionary <NSString *, id> *parameters;

/**
 Метод инициализации

 @param name имя фильтра
 @param parameters параметры фильтра
 @return экземпляр класса
 */
-(instancetype)initWithName: (NSString *)name parameters:(NSDictionary <NSString *, id>*)parameters;

@end
