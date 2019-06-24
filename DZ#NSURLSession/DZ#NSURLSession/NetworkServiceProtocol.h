//
//  NetworkServiceProtocol.h
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

@protocol NetworkServiceOutputProtocol <NSObject>
@optional

- (void)loadingContinuesWithProgress:(double)progress;
- (void)loadingIsDoneWithDataRecieved:(NSData *)dataRecieved;

@end

@protocol NetworkServiceIntputProtocol <NSObject>
@optional

- (void)configureUrlSessionWithParams:(NSDictionary *)params;
- (void)findFlickrPhotoWithSearchString:(NSString *)searcSrting;

@end


