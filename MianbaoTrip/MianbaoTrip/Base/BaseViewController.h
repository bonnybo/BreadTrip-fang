//
//  BaseViewController.h
//  IphoneWeibo
//
//  Created by Mac on 15-9-11.
//  Copyright (c) 2015年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIProgressView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"

@interface BaseViewController : UIViewController
{
    UIView *_tipView;
    MBProgressHUD *hud;
    UIWindow *_tipWindow;
    AFHTTPRequestOperation *operation;
}

//显示或者隐藏正在加载
- (void)showLoading:(BOOL)show;

//显示或者隐藏正在加载
- (void)showHUD:(NSString *)title;

//隐藏HUD
- (void)hideHUD;

//加载完成提示HUD
- (void)completeHUD:(NSString *)title;

- (void)showStatusTip:(NSString *)tip show:(BOOL)isshow;

@end
