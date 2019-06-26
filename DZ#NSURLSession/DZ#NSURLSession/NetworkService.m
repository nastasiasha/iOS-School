//
//  NetworkService.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "NetworkService.h"
#import "Photo.h"


@interface NetworkService ()

@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSData *resumeData;

@end

@implementation NetworkService 

- (void)configureUrlSessionWithParams:(NSDictionary *)params
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Настравиваем Session Configuration
    [sessionConfiguration setAllowsCellularAccess:YES];
    if (params)
    {
        [sessionConfiguration setHTTPAdditionalHeaders:params];//@{ @"Accept" : @"application/json" }];
    }
    else
    {
        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
    }
    
    // Создаем сессию
    self.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
}


- (void)findFlickrPhotoWithSearchString:(NSString *)searchString
{
    NSString *urlString = [NetworkHelper URLForSearchString:searchString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    
    NSURLSession *session;
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *arrayOfPhoto = temp[@"photos"][@"photo"];
        
        for (NSDictionary *i in arrayOfPhoto)
        {
            NSString *serverID = i[@"server"];
            NSString *ID = i[@"id"];
            NSString *secret = i[@"secret"];
            NSString *title = i[@"title"];
            
            NSString *location = [NSString stringWithFormat:@"https://farm1.staticflickr.com/%@/%@_%@.jpg",serverID,ID,secret];
//            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:location]];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            NSURL *url = [NSURL URLWithString:location];
            [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                Photo *photo = [[Photo alloc] initWithName:title image:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.output loadingIsDoneWithDataRecieved:photo];
                });
            }] resume];
            
        }
        
    }];
    [sessionDataTask resume];
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //[self.output loadingIsDoneWithDataRecieved:data];
    });
    [session finishTasksAndInvalidate];
}

@end
