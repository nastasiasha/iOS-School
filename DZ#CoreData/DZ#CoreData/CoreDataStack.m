//
//  CoreDataStack.m
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "CoreDataStack.h"


@implementation CoreDataStack

+ (instancetype)shared
{
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [CoreDataStack new];
    });
    return sharedInstance;
}

-(NSPersistentContainer *)container
{
    @synchronized (self) {
        if (_container)
        {
            return _container;
        }
        _container = [NSPersistentContainer persistentContainerWithName:@"IndexData"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull desc, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"Error: %@",error.localizedDescription);
                abort();
            }
        }];
        return _container;
    }
}


@end
