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
    UIButton *loginBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(100, 100, 100, 50);
    loginBtn.backgroundColor = [UIColor darkGrayColor];
    [loginBtn setTintColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    imgView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imgView];
    
}

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
                                           dic = @{@"icon":icon, @"nickname":nickName};
                                           //把字典写入到文件  atomically:原子性的 存在线程保护
                                           [dic writeToFile:filePath atomically:YES];
                                       }
//                                       imgView.image = [NSURL URLWithString:icon];
//                                       [imgView sd_setImageWithURL:[NSURL URLWithString:icon]];
//                                       [imgView sd_setImageWithURL:[NSURL URLWithString:icon] placeholderImage:[UIImage imageNamed:@"Default.png"]];
                                       
                                       [myVC _refreshView];
                                   } onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                       NSLog(@"%@",error);
                                       
                                   }];
    
    
    
}

- (void)_refreshView
{
    
//    headerLabel.text = [NSString stringWithFormat:@"%@ >", _newUser.nickname];
    
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
//        NSString *nickname = [dic objectForKey:@"nickname"];
        
//        headerLabel.text = [NSString stringWithFormat:@"%@ >", nickname];
        
        NSString *observer = [self description];
        
        [[MOBFImageService sharedInstance] getImageWithURL:[NSURL URLWithString:icon] observer:observer onLoading:nil onResult:^(NSData *imageData) {
            imgView.image = [[UIImage alloc] initWithData:imageData];
            [[MOBFImageService sharedInstance] removeObserver:observer];
        } onFail:nil];
    }
}




@end
