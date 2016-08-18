//
//  AppDelegate.m
//  GitTest
//
//  Created by 孔令才 on 16/8/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "AppDelegate.h"
#import "sys/utsname.h"
#import "AFNetworking.h"
#import "UMMobClick/MobClick.h"
#import "MainViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"
#import "AFNetworkActivityIndicatorManager.h"

#define kUMAppKey @"57b574b9e0f55aaf95000e80"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)getDeviceAndOSInfo
{
    //here use sys/utsname.h
    struct utsname systemInfo;
    //声明结构体，包含5个char数成员:sysname,nodename,release,version,machine
    uname(&systemInfo);
    //c方法，填写系统结构体内容，返回值为0，表示成功。
    
    //get the device model and the system version
    NSLog(@"%@", [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"%@", [NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding]);
    NSLog(@"%@", [NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding]);
    NSLog(@"%@", [NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding]);
    NSLog(@"%@", [NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding]);
    
//    NSString *string = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    NSLog(@"%@", [[UIDevice currentDevice] model]);
    NSLog(@"%@", [[UIDevice currentDevice] localizedModel]);
    NSLog(@"%@", [[UIDevice currentDevice] name]);
    NSLog(@"%@", [[UIDevice currentDevice] systemName]);
    
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey], (__bridge id)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey) ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey], deviceString, [[UIDevice currentDevice] systemVersion], ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0f)];
    NSLog(@"%@",userAgent);

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    UMConfigInstance.appKey = kUMAppKey;
    UMConfigInstance.channelId = @"App Store";
    [MobClick startWithConfigure:UMConfigInstance];
    [MobClick setLogEnabled:YES];
    
//    [self getDeviceAndOSInfo];
    MainViewController *mainVC = [MainViewController new];
    
    
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    mainNav.navigationBarHidden = YES;
    
    MineViewController *mineVC = [MineViewController new];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNav.navigationBarHidden = YES;
    
    UITabBarController *tabBarController =[[UITabBarController alloc]init];
    tabBarController.viewControllers = @[mainNav,mineNav];
    [mainNav.tabBarItem setTitle:@"首页"];
    [mineNav.tabBarItem setTitle:@"我的"];
    [self.window setRootViewController:tabBarController];
    
//    LoginViewController *loginVC = [LoginViewController new];
//    self.window.rootViewController = loginVC;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
