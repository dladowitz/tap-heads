//
//  AppDelegate.m
//  Do Things
//
//  Created by David Ladowitz on 4/17/14.
//  Copyright (c) 2014 Team1. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "MotionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    

    
    // Initialize View Controllers
    MapViewController *mapViewController           = [[MapViewController alloc] init];
    MotionViewController *motionViewController     = [[MotionViewController alloc] init];
    
    // Create Naviation Controllers with View Controllers
    UINavigationController *mapNavigationController         = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    UINavigationController *motionNavigationController    = [[UINavigationController alloc] initWithRootViewController:motionViewController];
    
    // Create Tab Bar Controller and Add Navigation Controller
//    UITabBarController *tabBarController = [[UITabBarController alloc] init];
//    tabBarController.viewControllers = @[mapNavigationController, motionNavigationController];
    
    // Configure Tab Bar Controller Buttons
//    mapNavigationController.tabBarItem.title      = @"Maps";
//    motionNavigationController.tabBarItem.title = @"Motion";
    
    // Set the Root View Controller

    self.window.rootViewController  = mapNavigationController;
    
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
