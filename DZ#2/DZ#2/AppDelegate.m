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
    redViewControllerFirst.view.translatesAutoresizingMaskIntoConstraints = NO;
    RedViewController *redViewControllerSecond = [RedViewController new];
    redViewControllerSecond.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Content
    BlueViewController *blueViewControllerFirst = [BlueViewController new];
    blueViewControllerFirst.view.translatesAutoresizingMaskIntoConstraints = NO;
    BlueViewController *blueViewControllerSecond = [BlueViewController new];
    blueViewControllerSecond.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    CustomContainerController *customControllerFirst = [CustomContainerController new];
    customControllerFirst.tabBarItem.title = @"First";
    CustomContainerController *customControllerSecond = [CustomContainerController new];
    customControllerSecond.tabBarItem.title = @"Second";
    
    // Добавление contentControllers на первую вкладку
    [customControllerFirst addChildViewController:redViewControllerFirst];
    [customControllerFirst.view addSubview:redViewControllerFirst.view];
    
    // constraints redViewControllerFirst
    [redViewControllerFirst.view.topAnchor constraintEqualToAnchor:customControllerFirst.view.topAnchor].active = YES;
    [redViewControllerFirst.view.bottomAnchor constraintEqualToAnchor:customControllerFirst.view.bottomAnchor].active = YES;
    [redViewControllerFirst.view.leftAnchor constraintEqualToAnchor:customControllerFirst.view.leftAnchor].active = YES;
    [redViewControllerFirst.view.rightAnchor constraintEqualToAnchor:customControllerFirst.view.centerXAnchor].active = YES;
    
    [redViewControllerFirst didMoveToParentViewController:customControllerFirst];
    
    [customControllerFirst addChildViewController:blueViewControllerFirst];
    [customControllerFirst.view addSubview:blueViewControllerFirst.view];
    
    // constraints blueViewController
    [blueViewControllerFirst.view.topAnchor constraintEqualToAnchor:customControllerFirst.view.topAnchor].active = YES;
    [blueViewControllerFirst.view.bottomAnchor constraintEqualToAnchor:customControllerFirst.view.bottomAnchor].active = YES;
    [blueViewControllerFirst.view.rightAnchor constraintEqualToAnchor:customControllerFirst.view.rightAnchor].active = YES;
    [blueViewControllerFirst.view.leftAnchor constraintEqualToAnchor:customControllerFirst.view.centerXAnchor].active = YES;
    
    [blueViewControllerFirst didMoveToParentViewController:customControllerFirst];
    
     // Добавление contentControllers на вторую вкладку
    [customControllerSecond addChildViewController:redViewControllerSecond];
    [customControllerSecond.view addSubview:redViewControllerSecond.view];
    
    // constraints redViewControllerFirst
    [redViewControllerSecond.view.topAnchor constraintEqualToAnchor:customControllerSecond.view.topAnchor].active = YES;
    [redViewControllerSecond.view.bottomAnchor constraintEqualToAnchor:customControllerSecond.view.centerYAnchor].active = YES;
    [redViewControllerSecond.view.leftAnchor constraintEqualToAnchor:customControllerSecond.view.leftAnchor].active = YES;
    [redViewControllerSecond.view.rightAnchor constraintEqualToAnchor:customControllerSecond.view.rightAnchor].active = YES;
    
    [redViewControllerSecond didMoveToParentViewController:customControllerSecond];
    
    [customControllerSecond addChildViewController:blueViewControllerSecond];
    [customControllerSecond.view addSubview:blueViewControllerSecond.view];
    
    // constraints blueViewController
    [blueViewControllerSecond.view.topAnchor constraintEqualToAnchor:customControllerSecond.view.centerYAnchor].active = YES;
    [blueViewControllerSecond.view.bottomAnchor constraintEqualToAnchor:customControllerSecond.view.bottomAnchor].active = YES;
    [blueViewControllerSecond.view.rightAnchor constraintEqualToAnchor:customControllerSecond.view.rightAnchor].active = YES;
    [blueViewControllerSecond.view.leftAnchor constraintEqualToAnchor:customControllerSecond.view.leftAnchor].active = YES;
    
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
