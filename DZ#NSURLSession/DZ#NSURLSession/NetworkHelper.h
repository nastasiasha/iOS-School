//
//  NetworkHelper.h
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSUInteger const count;

NS_ASSUME_NONNULL_BEGIN

@interface NetworkHelper : NSObject

+ (NSString *)URLForSearchString:(NSString *)searchString;

@end

NS_ASSUME_NONNULL_END
