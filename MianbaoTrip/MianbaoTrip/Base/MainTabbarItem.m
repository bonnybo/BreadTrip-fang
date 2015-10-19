//
//  MainTabbarItem.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "MainTabbarItem.h"

@implementation MainTabbarItem

- (instancetype)initWithFrame:(CGRect)frame
                    imageName:(NSString *)name
                        title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        //..
        //创建子视图
        //创建图片
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/5, 49)];
        //设置内容模式
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.image = [UIImage imageNamed:name];
        [self addSubview:imgView];
        
        
    }
    
    return self;
}


@end
