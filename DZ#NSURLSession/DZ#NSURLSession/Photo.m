//
//  Photo.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 26/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype) initWithName: (NSString *)name image: (NSData *)imageData
{
    self = [super init];
    
    if (self)
    {
        UIImage *imageFromData = [UIImage imageWithData:imageData];
        _image = imageFromData;
        _name = name;
    }

    return self;
}

@end
