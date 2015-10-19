//
//  WXNavigationController.m
//  Project_Weibo35
//
//  Created by keyzhang on 15/5/16.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//


#import "WXNavigationController.h"

@interface WXNavigationController ()

@property (nonatomic,strong) UIView *backgroundView;   //背景视图
@property (nonatomic,strong) UIImageView *backImageView;   //截图视图
@property (nonatomic,strong) UIView *alphaView;   //遮罩视图

@end

@implementation WXNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 重写导航控制器的push 和pop方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //创建动画视图
    [self pushSetAnimationView];
    
    //把内容视图移动到屏幕的右边，设置透明度和缩放
    [self moveViewPushWithX:kScreenWidth];
    
    //执行无动画导航
    [super pushViewController:viewController animated:NO];
    
    //执行动画
    [UIView animateWithDuration:.35 animations:^{
        [self moveViewPushWithX:0];
    } completion:^(BOOL finished) {
        // 恢复设置
        _backImageView.transform = CGAffineTransformIdentity;
        [_backImageView removeFromSuperview];
        [_backgroundView removeFromSuperview];
        [_alphaView removeFromSuperview];
    }];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    //创建动画视图
    [self popSetAnimationView];
    
    //把内容视图移动到屏幕的右边，设置透明度和缩放
    [self moveViewPopWithX:0];
    
    //执行无动画导航
    UIViewController *viewCtrl = [super popViewControllerAnimated:NO];
    
    //执行动画
    [UIView animateWithDuration:.35 animations:^{
        [self moveViewPopWithX:kScreenWidth];
    } completion:^(BOOL finished) {
        // 恢复设置
        UIView *contextView = self.tabBarController == nil ? self.view : self.tabBarController.view;
        contextView.transform = CGAffineTransformIdentity;
        [_backImageView removeFromSuperview];
        [_backgroundView removeFromSuperview];
        [_alphaView removeFromSuperview];
    }];
    
    
    return viewCtrl;
}

// 创建POP时候动画的视图
- (void)popSetAnimationView
{
    //获取当前设备的截图
    UIImage *captureImage = [self capture];
    
    //视图的大小
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    CGRect frame = CGRectMake(0, 0, kScreenWidth, version >= 7.0 ? kScreenHeight : kScreenHeight - 20);
    
    //创建背景视图
    if (_backgroundView == nil) {
        _backgroundView = [[UIView alloc] initWithFrame:frame];
        _backgroundView.backgroundColor = [UIColor blackColor];
    }
    //添加到截图视图之前
    UIView *contextView = self.tabBarController == nil ? self.view : self.tabBarController.view;
    [contextView.superview insertSubview:_backgroundView belowSubview:contextView];
    
    //遮罩视图
    if (_alphaView == nil) {
        _alphaView = [[UIView alloc] initWithFrame:frame];
        _alphaView.backgroundColor = [UIColor blackColor];
        _alphaView.alpha = .1;
    }
    [contextView.superview insertSubview:_alphaView aboveSubview:contextView];
    
    //创建截图视图
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:frame];
    }
    _backImageView.left = 0;
    // 设置图片并添加
    _backImageView.image = captureImage;
    [contextView.superview insertSubview:_backImageView aboveSubview:_alphaView];
}

// 创建PUSH时候的动画视图
- (void)pushSetAnimationView
{
    //获取当前设备的截图
    UIImage *captureImage = [self capture];
    
    //视图的大小
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    //创建背景视图
    if (_backgroundView == nil) {
        _backgroundView = [[UIView alloc] initWithFrame:frame];
        _backgroundView.backgroundColor = [UIColor blackColor];
    }
    //添加到截图视图之前
    UIView *contextView = self.tabBarController == nil ? self.view : self.tabBarController.view;
    [contextView.superview insertSubview:_backgroundView belowSubview:contextView];
    
    //创建截图视图
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:frame];
    }
    _backImageView.left = 0;
    //设置图片并添加
    _backImageView.image = captureImage;
    [contextView.superview insertSubview:_backImageView belowSubview:contextView];
    
    //遮罩视图
    if (_alphaView == nil) {
        _alphaView = [[UIView alloc] initWithFrame:frame];
        _alphaView.backgroundColor = [UIColor blackColor];
        _alphaView.alpha = .1;
    }
    [contextView.superview insertSubview:_alphaView belowSubview:contextView];
    
    
}

// 获取当前设备的截图
- (UIImage *)capture
{
    // 获取需要截取的视图
    UIView *view = self.tabBarController == nil ? self.view : self.tabBarController.view;
    if (view == nil) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

#pragma mark - 导航效果设置
- (void)moveViewPushWithX:(float)x
{
    // 容错 0 < x < kScreenWidth
    x = MIN(x, kScreenWidth);
    x = MAX(x, 0);
    
    // 定义视图的缩放比例
    float scale = (x / kScreenWidth) * .1 + .9;
    _backImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 定义遮罩视图的透明度
    float alpha = .5 - (x / kScreenWidth) * .5;
    _alphaView.alpha = alpha;
    
    // 当前内容视图移动到最右边
    UIView *contextView = self.tabBarController == nil ? self.view : self.tabBarController.view;
    contextView.left = x;
}

- (void)moveViewPopWithX:(float)x
{
    // 容错 0 < x < kScreenWidth
    x = MIN(x, kScreenWidth);
    x = MAX(x, 0);
    
    // 定义视图的缩放比例
    float scale = (x / kScreenWidth) * .1 + .9;
    UIView *contextView = self.tabBarController == nil ? self.view : self.tabBarController.view;
    contextView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 定义遮罩视图的透明度
    float alpha = .5 - (x / kScreenWidth) * .5;
    _alphaView.alpha = alpha;
    
    // 当前内容视图移动到最右边
    _backImageView.left = x;
}

@end
