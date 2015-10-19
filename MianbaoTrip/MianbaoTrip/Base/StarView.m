//
//  StarView.m
//  WXMovie47
//
//  Created by keyzhang on 15/8/21.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

#import "StarView.h"

@interface StarView ()
{
    UIView *_grayView;
    UIView *_yellowView;
}

@end


@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _createView];
}

- (void)_createView
{
    
    self.backgroundColor = [UIColor redColor];
    
    UIImage *grayImg = [UIImage imageNamed:@"gray.png"];
    UIImage *yellowImg = [UIImage imageNamed:@"yellow.png"];
    
    //创建灰色星星视图
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    
    //创建黄色的星星
    _yellowView = [[UIView alloc] initWithFrame:_grayView.bounds];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];
    
    //让当前视图的宽度等于高度的5倍
    self.width = self.height * 5;
    
    
    //星星要进行缩放
    //计算缩放的倍数
    CGFloat scale = self.height / grayImg.size.height;
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //当星星视图修改了transform后，坐标会变，需要重新恢复坐标
    _grayView.origin = CGPointMake(0, 0);
    _yellowView.origin = CGPointZero;
    
    //设置背景为透明
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)setRating:(CGFloat)rating
{
    if (_rating != rating) {
        _rating = rating;
 
    }
    if (_rating == 0) {
        _yellowView.width =0;
    }else{
        _yellowView.width = self.rating / 10 * _grayView.width;
    }
}




@end
