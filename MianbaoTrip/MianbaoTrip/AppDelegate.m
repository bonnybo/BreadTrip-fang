//
//  AppDelegate.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    注册第三方平台
    [ShareSDK registerApp:@"LDFApp"
          activePlatforms:@[@(SSDKPlatformTypeSinaWeibo)]
                 onImport:nil
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
              switch (platformType) {
                  case SSDKPlatformTypeSinaWeibo:
                      [appInfo SSDKSetupSinaWeiboByAppKey:kAppKey
                                                appSecret:kAppSecret
                                              redirectUri:kAppRedirectURI
                                                 authType:SSDKAuthTypeBoth];
                      break;
                      
                  default:
                      break;
              }
          }];
    
    
    
    
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    imgView.image = [UIImage imageNamed:@"open.png"];
    
    
    //开机动画
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self.window addSubview:imgView];
                     } completion:^(BOOL finished) {
                         [imgView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:2];
                     }];
    

    
    return YES;
}

//修改状态栏的样式
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

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
