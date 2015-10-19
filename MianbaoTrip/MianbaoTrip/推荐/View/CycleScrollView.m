//
//  CycleScrollView.m
//  ScrollDemo
//
//  Created by keyzhang on 15/9/8.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "CycleScrollView.h"
#import "BannerViewController.h"

@interface CycleScrollView ()
{
    UIButton *leftButton;
    UIButton *centerButton;
    UIButton *rightButton;
    NSTimer *_moveTimer;
    UIPageControl *_pageCtrl;
    BOOL _isTimeUp;
}

@end

@implementation CycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _costomInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _costomInit];
}

//创建三个承载图片的按钮
- (void)_costomInit
{
    
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = NO;
    self.contentSize = CGSizeMake(self.frame.size.width * 3, 0);
    self.pagingEnabled = YES;
    
    //控制视图
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = self.bounds;
    [self addSubview:leftButton];
    
    
    centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    centerButton.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    [centerButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:centerButton];
    
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:rightButton];
    
    _isTimeUp = NO;
    
//设置当前偏移量，显示当前中间的图片
    self.contentOffset = CGPointMake(self.frame.size.width, 0);
    [self _createPageCtrl];
    [self _createTimer];

}

//点击进入详情界面
- (void)btnClick:(UIButton *)btn
{
    BannerViewController *adVC = [[BannerViewController alloc] init];
    adVC.url = self.webArr[_selectedIndex];
    [self.viewController.navigationController pushViewController:adVC animated:YES];
}

//当滑动停止的时候调用的方法
-(void)scrollViewDidEndDecelerating:(CycleScrollView *)scrollView
{
        CGFloat xOff = self.contentOffset.x;
    
//    此部分是获得下标
//    根据偏移量判断滑动方向
        if (xOff == 0) {    //向左滑动
            if (_selectedIndex == 0) {
//                如果当前是最后一张图片，让下标变成最后一张图片，让页面控制器变成和下标一样。
                _selectedIndex = self.imgs.count - 1;
                _pageCtrl.currentPage = self.imgs.count-1;
            }else {
                _selectedIndex = _selectedIndex - 1;
                _pageCtrl.currentPage = (_pageCtrl.currentPage - 1)%self.imgs.count;
            }
        } else if (xOff == self.frame.size.width * 2) {   //向右滑动
//            如果是最后一张图片做处理
            if (_selectedIndex == self.imgs.count -1) {
//                如果是最后一张图片，将下标变为0
                _selectedIndex = 0;
            }else {
                _selectedIndex = _selectedIndex + 1;
            }
            _pageCtrl.currentPage = (_pageCtrl.currentPage + 1)%self.imgs.count;
        }
    
//        根据下标设置图片
        //设置左边图片
        if (_selectedIndex == 0) {
            [leftButton setBackgroundImage:self.imgs.lastObject forState:UIControlStateNormal];
        }else {
            [leftButton setBackgroundImage:self.imgs[_selectedIndex - 1] forState:UIControlStateNormal];
        }
        
        //设置中间图片
        [centerButton setBackgroundImage:self.imgs[_selectedIndex] forState:UIControlStateNormal];
        
        
        //设置右边图片
//    如果当前照片是最后一张，就设置第一张
        if (_selectedIndex == self.imgs.count - 1) {
            [rightButton setBackgroundImage:self.imgs[0] forState:UIControlStateNormal];
        }else {
            [rightButton setBackgroundImage:self.imgs[_selectedIndex + 1] forState:UIControlStateNormal];
        }
        
        //每次都显示中间的视图
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
    if (!_isTimeUp) {
//        开启定时器,关闭定时器
        [_moveTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];
    }
    _isTimeUp = NO;
}
- (void)setImgs:(NSArray *)imgs
{
    NSMutableArray *selfImgs = [NSMutableArray arrayWithArray:imgs];
    
    if (imgs.count < 3) {
        [selfImgs addObjectsFromArray:imgs];
    }
    _imgs = selfImgs;
    [leftButton setBackgroundImage:_imgs.lastObject forState:UIControlStateNormal];
    [centerButton setBackgroundImage:_imgs[0] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:_imgs[1] forState:UIControlStateNormal];
}
- (void)setWebArr:(NSArray *)webArr
{
    if (_webArr != webArr) {
        _webArr = webArr;
    }
    _pageCtrl.numberOfPages = self.imgs.count;
}
- (void)_createPageCtrl
{
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - 100) / 2, self.bottom - 20, 100, 10)];
    _pageCtrl.tag = 100;
    _pageCtrl.numberOfPages = self.imgs.count;
    [self performSelector:@selector(addPage) withObject:nil afterDelay:0.1f];
}
- (void)addPage
{
    [self.superview addSubview:_pageCtrl];
}

- (void)_createTimer
{
//    创建此类定时器系统自动添加定时器到线程中
//   _moveTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeAD:) userInfo:nil repeats:YES];
//    创建此类定时器需要手动添加到线程中
    _moveTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(changeAD:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_moveTimer forMode:NSRunLoopCommonModes];
}
- (void)changeAD:(NSTimer *)timer
{
    [self setContentOffset:CGPointMake(kScreenWidth * 2, 0) animated:YES];
    _isTimeUp = YES;
    NSTimer *tim = [NSTimer timerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop]addTimer:tim forMode:NSRunLoopCommonModes];
}


@end
