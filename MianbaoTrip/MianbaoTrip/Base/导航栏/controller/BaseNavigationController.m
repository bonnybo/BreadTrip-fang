//
//  BaseNavigationController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    设置非半透明
    self.navigationBar.translucent = NO;
//设置代理
    self.delegate = self;
    
    UIImage *navbgImg = [UIImage imageNamed:@"account_uploadavatar_btn.png"];
    [self.navigationBar setBackgroundImage:navbgImg forBarMetrics:UIBarMetricsDefault];
    //修改导航栏标题的颜色和字体大小
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    
 
}

//修改状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -- UINavigationControllerDelegate
//设置当当前界面不是一级界面的时候，让下面的tabbar隐藏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger count = self.viewControllers.count;
    MainTabBarController *mainTBC = (MainTabBarController *)self.tabBarController;
    if (count == 1) {
        mainTBC.tabBar.right =kScreenWidth;
        mainTBC.tabBar.hidden = NO;
    }else if (count == 2)
    {
        mainTBC.tabBar.right =0;
        mainTBC.tabBar.hidden = YES;
    }
    
}



@end
