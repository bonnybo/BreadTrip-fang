//
//  MyViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "MyViewController.h"
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import <MOBFoundation/MOBFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface MyViewController ()
{
    SSDKUser *_newUser;
    UIImageView *imgView;
    UILabel *label;
    
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";

}
- (void)createBackBtn
{
//    登录
    UIButton *loginBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(50, 40, 100, 50);
    loginBtn.backgroundColor = [UIColor darkGrayColor];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
//    头像
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 120, 100, 100)];
    imgView.backgroundColor = [UIColor yellowColor];
    imgView.layer.cornerRadius = 50.0;
    imgView.layer.masksToBounds = YES;
    [self.view addSubview:imgView];
    
//    昵称
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, imgView.bottom+5, 200, 40)];
    label.backgroundColor= [UIColor yellowColor];
    [self.view addSubview:label];
    
//    分享
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(200, 40, 100, 50);
    shareBtn.backgroundColor = [UIColor darkGrayColor];
    [shareBtn setTintColor:[UIColor whiteColor]];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    
//    支付
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.frame = CGRectMake(30, label.bottom+20 , 100, 50);
    payBtn.backgroundColor = [UIColor darkGrayColor];
    [payBtn setTintColor:[UIColor whiteColor]];
    [payBtn setTitle:@"分享" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
    
    
    
    
}

//第三方登录
- (void)login
{
    __weak MyViewController *myVC = self;
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeSinaWeibo
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       associateHandler (user.uid,user,user);
                                       _newUser = user;
                                       NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MianBaoTrip.plist"];
                                       NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
                                    
                                       NSString *icon = _newUser.icon;
                                       NSString *nickName = _newUser.nickname;
                                       if (icon.length != 0) {
//                                           把头像和昵称存入了字典中，然后存入了文件中
                                           dic = @{@"icon":icon, @"nickname":nickName};
                                           //把字典写入到文件  atomically:原子性的 存在线程保护
                                           [dic writeToFile:filePath atomically:YES];
                                       }

                                       
                                       [myVC _refreshView];
                                   } onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                       NSLog(@"%@",error);
                                       
                                   }];
    
    
    
}

- (void)_refreshView
{
    
    label.text = [NSString stringWithFormat:@"%@ ", _newUser.nickname];
    
    NSString *observer = [self description];
    
    [[MOBFImageService sharedInstance] getImageWithURL:[NSURL URLWithString:_newUser.icon] observer:observer onLoading:nil onResult:^(NSData *imageData) {
        imgView.image = [[UIImage alloc] initWithData:imageData];
        [[MOBFImageService sharedInstance] removeObserver:observer];
    } onFail:nil];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    NSLog(@"%@", NSHomeDirectory());
    
    //获取沙盒目录
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MianBaoTrip.plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    //区分是第一次启动应用还是以后启动
    if (dic != nil) {//非第一次启动
        NSString *icon = [dic objectForKey:@"icon"];
        NSString *nickname = [dic objectForKey:@"nickname"];
        
        label.text = [NSString stringWithFormat:@"%@ ", nickname];
        
        NSString *observer = [self description];
        
        [[MOBFImageService sharedInstance] getImageWithURL:[NSURL URLWithString:icon] observer:observer onLoading:nil onResult:^(NSData *imageData) {
            imgView.image = [[UIImage alloc] initWithData:imageData];
            
            [[MOBFImageService sharedInstance] removeObserver:observer];
        } onFail:nil];
    }
}

//微博分享
- (void)shareAction
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params SSDKSetupShareParamsByText:@"分享内容 @value(url)"
                                images:@[[UIImage imageNamed:@"dainiwan.png"],[UIImage imageNamed:@"tuijian.png"]]
                                   url:[NSURL URLWithString:@"http://baidu.com"]
                                 title:@"分享标题"
                                  type:SSDKContentTypeImage];
    
    
    
    
    
    [ShareSDK share:SSDKPlatformTypeSinaWeibo
         parameters:params
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"分享成功" message:@"已经分享到微博" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                 [alertView show];
                 NSLog(@"分享成功");
                 break;

             }
            case SSDKResponseStateFail:
             {
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"分享失败" message:@"分享到微博失败！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"%@",error, nil];
                 [alertView show];
                  break;
             }
            
             default:
                 break;
         }
     }];
    
    
}

//支付功能代码待实现
- (void)payAction
{
    NSLog(@"支付功能");
}


@end
