//
//  Photo.h
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 26/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,copy) NSString *name;
- (instancetype) initWithName: (NSString *)name image: (NSData *)imageData;

@end

NS_ASSUME_NONNULL_END
