//
//  BaseViewController.m
//  IphoneWeibo
//
//  Created by Mac on 15-9-11.
//  Copyright (c) 2015年 wxhl. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    [self createBackBtn];
 
}

- (void)createBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(15, 25, 20, 15);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)backAction:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)showLoading:(BOOL)show
{
    if (_tipView == nil) {
        _tipView = [[UIView alloc]initWithFrame:self.view.bounds];
        _tipView.backgroundColor = [UIColor whiteColor];
        
        UILabel *loadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (_tipView.height-20)-100, _tipView.width,20)];
        loadLabel.textAlignment = NSTextAlignmentCenter;
        loadLabel.text = @"正在加载";
        loadLabel.backgroundColor = [UIColor clearColor];
        [_tipView addSubview:loadLabel];
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicator.frame = CGRectMake(100, loadLabel.top, 20, 20);
        [indicator startAnimating];
        [_tipView addSubview:indicator];
    }
    if (show) {
        [self.view addSubview:_tipView];
    }else{
        [_tipView removeFromSuperview];
    }
 
}

//加载显示视图
- (void)showHUD:(NSString *)title
{
    if (hud == nil) {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    hud.dimBackground = YES;
    hud.labelText = title;
    
}

- (void)hideHUD
{
    [hud hide:YES afterDelay:1.5];
}

- (void)completeHUD:(NSString *)title
{
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = title;
    [hud hide:YES afterDelay:1.5];
}

- (void)showStatusTip:(NSString *)tip show:(BOOL)isshow
{
    
    
    if (_tipWindow == nil) {
        _tipWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)
        ];
        _tipWindow.windowLevel = UIWindowLevelStatusBar;
        _tipWindow.backgroundColor = [UIColor blackColor];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:_tipWindow.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        
        label.tag = 200;
        label.font  =[UIFont systemFontOfSize:16];
        [_tipWindow addSubview:label];
        
        UIProgressView *progressview = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 5)];
        progressview.tintColor = [UIColor redColor];
        progressview.tag = 300;
        [_tipWindow addSubview:progressview];
        
        
    }
    
    
    UILabel *label = (UILabel *)[_tipWindow viewWithTag:200];
    UIProgressView *progressview = (UIProgressView *)[_tipWindow viewWithTag:300];
    
    
    _tipWindow.hidden = NO;
    label.text = tip;
    if (isshow) {
        
        if (operation == nil) {
            [progressview  setProgressWithUploadProgressOfOperation:operation animated:YES];
        }else {
            progressview.hidden = YES;
        }
    }else{
        [self performSelector:@selector(removeTipwindow) withObject:nil afterDelay:1.5];
    }
}

- (void)removeTipwindow
{
    _tipWindow.hidden = YES;
    _tipWindow = nil;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
