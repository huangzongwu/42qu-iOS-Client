//
//  AppDelegate.m
//  42qu
//
//  Created by Alex Rezit on 12-5-22.
//  Copyright (c) 2012年 Seymour Dev. All rights reserved.
//

#import "AppDelegate.h"

#import "UpdateRootViewController.h"
#import "NotificationRootViewController.h"
#import "PeopleRootViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

@synthesize updateNavigationController = _updateNavigationController;
@synthesize notificationNavigationController = _notificationNavigationController;
@synthesize peopleNavigationController = _peopleNavigationController;

static BOOL isLoggedIn = NO;

+ (BOOL)isLoggedIn
{
    return isLoggedIn;
}

#pragma mark - Life cycle

- (void)dealloc
{
    [_updateNavigationController release];
    [_notificationNavigationController release];
    [_peopleNavigationController release];
    [_tabBarController release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Init window & tab bar controller
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    // Init & add tab bar controller's view controllers
    UpdateRootViewController *updateRootViewController = [[UpdateRootViewController alloc] init];
    self.updateNavigationController = [[UINavigationController alloc] initWithRootViewController:updateRootViewController];
    [updateRootViewController release];
    
    NotificationRootViewController *notificationRootViewController = [[NotificationRootViewController alloc] init];
    self.notificationNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationRootViewController];
    [notificationRootViewController release];
    
    PeopleRootViewController *peopleRootViewController = [[PeopleRootViewController alloc] init];
    self.peopleNavigationController = [[UINavigationController alloc] initWithRootViewController:peopleRootViewController];
    [peopleRootViewController release];
    
    _tabBarController.viewControllers = [NSArray arrayWithObjects:_updateNavigationController, _notificationNavigationController, _peopleNavigationController, nil];
    
    [self.window setRootViewController:_tabBarController];
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
