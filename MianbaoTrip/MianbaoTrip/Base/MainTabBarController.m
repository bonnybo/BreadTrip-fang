//
//  MainTabBarController.m
//  WXMovie47
//
//  Created by keyzhang on 15/8/19.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainTabbarItem.h"

@interface MainTabBarController ()
{
    UIImageView *_selectedImgView;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isRo = YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    

    
    [self _createTabbar];
    
}


- (void)_createTabbar
{
    
    if (_selectedImgView) {
        return;
    }
    
    //设置tabbar的背景
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"]];
    
    //删除系统的tabbarItem
    NSArray *array = self.tabBar.subviews;
    for (UIView *view in array) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass: cls]) {
            [view removeFromSuperview];
        }
    }
    
    //创建自己的图片
    
    //    //创建选择视图
//    _selectedImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_btn.png"]];
//    _selectedImgView.frame = CGRectMake(0, 0, kScreenWidth/5, 49);

//    [self.tabBar addSubview:_selectedImgView];
    
    _selectedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/5, 49)];
    
    //创建按钮
    NSArray *imgArr = @[@"tuijian.png",
                        @"dainiwan.png",
                        @"paizhao.png",
                        @"mudidi.png",
                        @"wo.png"];
    
   
    
    CGFloat width = kScreenWidth / imgArr.count;
    CGFloat height = self.tabBar.height;
    
    for (int i = 0; i < imgArr.count; i++) {
        NSString *imgName = imgArr[i];
       
        MainTabbarItem *item = [[MainTabbarItem alloc] initWithFrame:CGRectMake(width * i, 0, width, height)
                                                           imageName:imgName
                                                               title:nil];
        
        item.tag = 2015 + i;
        [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:item];
        _selectedImgView.alpha = 1;
        [self.tabBar addSubview:_selectedImgView];
        
        if (i == 0) {
            _selectedImgView.image = [UIImage imageNamed:@"11.png"];
            _selectedImgView.center = item.center;
        }if (i == 2) {
            
            addView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth/5-30)/2, 9, 30, 30)];
            addView.tag = 200;
            addView.image = [UIImage imageNamed:@"add.png"];
            [item addSubview:addView];
            
            

            
        }
    }
}

- (void)createFirstView
{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49)];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.5;
    bgView.hidden = YES;
    [self.view addSubview:bgView];
    firstView = [[UIImageView alloc]initWithFrame:CGRectZero];
    firstView.image = [UIImage imageNamed:@"first.png"];
    firstView.frame = CGRectMake(kScreenWidth/2, kScreenHeight, 0, 0);
    firstView.hidden = YES;
  
    [self.view addSubview:firstView];
    secondView = [[UIImageView alloc]initWithFrame:CGRectZero];
    secondView.image = [UIImage imageNamed:@"second.png"];
    secondView.frame = CGRectMake(kScreenWidth/2, kScreenHeight, 0, 0);
    secondView.hidden = YES;
    [bgView addSubview:secondView];
}


- (void)clickItem:(MainTabbarItem *)item
{
    
    self.selectedViewController = self.viewControllers[item.tag - 2015];
    if (item.tag == 2015+2) {
        if (isRo == NO) {
            [self createFirstView];
            [self showAnimation];
        }
    else{
        [self hideAnimation];
        }
    }else{
        [self hideAnimation];
    }
    _selectedImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",item.tag -2015+11]];
    _selectedImgView.center = item.center;
    isRo = !isRo;
}

- (void)showAnimation
{
    [self addAnimation];
    [UIView animateWithDuration:0.5
                     animations:^{
                         bgView.hidden = NO;
                         addView.transform = CGAffineTransformMakeRotation( 3 * M_PI / 4);
                         firstView.hidden = NO;
                         firstView.frame = CGRectMake((kScreenWidth-80)/2, kScreenHeight - 200, 80, 80);
                         secondView.hidden = NO;
                         secondView.frame = CGRectMake((kScreenWidth-80)/2, kScreenHeight-125, 80, 80);
                         
                     } completion:^(BOOL finished) {
                         [firstView.layer removeAnimationForKey:@"group"];
                         [secondView.layer removeAnimationForKey:@"group"];
                     }];
   
}
- (void)addAnimation
{
//    组动画
    //旋转
     CABasicAnimation *firstViewAnimation = [CABasicAnimation animation];
     firstViewAnimation.fromValue = @0;
     firstViewAnimation.toValue = @(M_PI*2);
     firstViewAnimation.keyPath = @"transform.rotation.z";
    
    //缩放
    CABasicAnimation *secondAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    secondAnimation.fromValue = @0;
    secondAnimation.toValue = @1;
    
    //组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.5;
    group.animations = @[firstViewAnimation, secondAnimation];
    [firstView.layer addAnimation:group forKey:@"group"];
    [secondView.layer addAnimation:group forKey:@"group"];
    
}
- (void)backAnimation
{
    //旋转
    CABasicAnimation *firstViewAnimation = [CABasicAnimation animation];
    firstViewAnimation.fromValue = @0;
    firstViewAnimation.toValue = @(-M_PI*2);
    firstViewAnimation.keyPath = @"transform.rotation.z";
    
//    //缩放
//    CABasicAnimation *secondAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    secondAnimation.fromValue = @0;
//    secondAnimation.toValue = @1;
    
    //组动画
    CAAnimationGroup *group1 = [CAAnimationGroup animation];
    group1.duration = 0.5;
    group1.animations = @[firstViewAnimation];
    [firstView.layer addAnimation:group1 forKey:@"group1"];
    [secondView.layer addAnimation:group1 forKey:@"group1"];
}
- (void)hideAnimation
{
    [self backAnimation];
    [UIView animateWithDuration:0.5
                     animations:^{
                       addView.transform = CGAffineTransformIdentity;
                         firstView.frame = CGRectMake(kScreenWidth/2, kScreenHeight, 0, 0);
                         [bgView removeFromSuperview];

                     } completion:^(BOOL finished) {
                         [firstView.layer removeAnimationForKey:@"group1"];
                     }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
