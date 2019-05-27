//
//  AppDelegate.m
//  DZ#2
//
//  Created by Анастасия Шахлан on 27/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "AppDelegate.h"
#import "RedViewController.h"
#import "BlueViewController.h"
#import "CustomContainerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Content
    RedViewController *redViewControllerFirst = [RedViewController new];
    RedViewController *redViewControllerSecond = [RedViewController new];
    
    //Content
    BlueViewController *blueViewControllerFirst = [BlueViewController new];
    BlueViewController *blueViewControllerSecond = [BlueViewController new];
    
    CustomContainerController *customControllerFirst = [CustomContainerController new];
    customControllerFirst.tabBarItem.title = @"First";
    CustomContainerController *customControllerSecond = [CustomContainerController new];
    customControllerSecond.tabBarItem.title = @"Second";
    
    // Добавление contentControllers на первую вкладку
    [customControllerFirst addChildViewController:redViewControllerFirst];
    redViewControllerFirst.view.frame = CGRectMake(0, 0, customControllerFirst.view.frame.size.width, customControllerFirst.view.frame.size.height/2.f);
    [customControllerFirst.view addSubview:redViewControllerFirst.view];
    [redViewControllerFirst didMoveToParentViewController:customControllerFirst];
    
    [customControllerFirst addChildViewController:blueViewControllerFirst];
    blueViewControllerFirst.view.frame = CGRectMake(0, customControllerFirst.view.frame.size.height/2.f, customControllerFirst.view.frame.size.width, customControllerFirst.view.frame.size.height/2.f);
    [customControllerFirst.view addSubview:blueViewControllerFirst.view];
    [blueViewControllerFirst didMoveToParentViewController:customControllerFirst];
    
     // Добавление contentControllers на вторую вкладку
    [customControllerSecond addChildViewController:redViewControllerSecond];
    redViewControllerSecond.view.frame = CGRectMake(0, 0, customControllerSecond.view.frame.size.width/2.f, customControllerSecond.view.frame.size.height);
    [customControllerSecond.view addSubview:redViewControllerSecond.view];
    [redViewControllerSecond didMoveToParentViewController:customControllerSecond];
    
    [customControllerSecond addChildViewController:blueViewControllerSecond];
    blueViewControllerSecond.view.frame = CGRectMake(customControllerSecond.view.frame.size.width/2.f, 0, customControllerSecond.view.frame.size.width/2.f, customControllerSecond.view.frame.size.height);
    [customControllerSecond.view addSubview:blueViewControllerSecond.view];
    [blueViewControllerSecond didMoveToParentViewController:customControllerSecond];
    
    
    
    //Container
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[customControllerFirst,customControllerSecond];
    
    self.window.rootViewController = tabBarController;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
