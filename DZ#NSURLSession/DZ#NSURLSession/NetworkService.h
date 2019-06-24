//
//  NetworkService.h
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkServiceProtocol.h"
#import "NetworkHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject<NetworkServiceIntputProtocol, NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, weak) id<NetworkServiceOutputProtocol> output; /**< Делегат внешних событий */

@end

NS_ASSUME_NONNULL_END
