//
//  BannerViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BannerViewController.h"

@interface BannerViewController ()

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"面包旅行";
//    UIImageView *titleImg = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 200)/2, 0, 200, 39)];
//    titleImg.image = [UIImage imageNamed:@"navbar.png"];
//    [self.navigationController.navigationBar addSubview:titleImg];
    
    UIButton *rightView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightView setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [rightView addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //新建网页视图
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
  
  
    //网页视图自适应屏幕的尺寸
    _webView.scalesPageToFit = YES;
    
    //设置代理
    _webView.delegate = self;
    
    [self.view addSubview:_webView];

    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
        //网页控件加载一个网络请求
   [_webView loadRequest:mRequest];
    
    
}

- (void)shareAction
{
    NSLog(@"分享");
}


#pragma mark--UIWebViewDelegate方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [self showHUD:@"正在加载"];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [self completeHUD:@"加载完成"];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

#pragma mark--UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"hehedada");
}


@end
