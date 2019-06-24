//
//  NetworkHelper.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "NetworkHelper.h"

NSUInteger const count = 20;

@implementation NetworkHelper

+ (NSString *)URLForSearchString:(NSString *)searchString
{
    NSString *APIKey = @"5553e0626e5d3a905df9a76df1383d98";
    return [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=%lu&format=json&nojsoncallback=1", APIKey, searchString,count];
}

@end
