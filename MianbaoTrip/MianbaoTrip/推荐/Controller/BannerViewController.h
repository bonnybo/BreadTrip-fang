//
//  BannerViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseViewController.h"

@interface BannerViewController : BaseViewController<UIWebViewDelegate,UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIWebView *_webView;
}

@property (nonatomic,copy) NSString *url;
@end
