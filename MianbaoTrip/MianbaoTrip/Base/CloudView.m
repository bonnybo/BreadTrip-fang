//
//  CloudView.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "CloudView.h"

static CloudView *cloudView = nil;

@implementation CloudView

+ (UIView *)createCloud
{
    if (cloudView == nil) {
        @synchronized(self){
            cloudView = [[CloudView alloc]init];
            
            UIImageView *yunView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 80)/2, (kScreenHeight-50-49-64)/2, 80, 50)];
            yunView.image = [UIImage imageNamed:@"yun.png"];
            
            UIImageView *littleYunView = [[UIImageView alloc]initWithFrame:CGRectMake(yunView.right-15, yunView.top+10, 60, 40)];
            littleYunView.image = [UIImage imageNamed:@"yun.png"];
            [cloudView addSubview:yunView];
            [cloudView insertSubview:littleYunView belowSubview:yunView];
//            NSLog(@"%.2f",yunView.right);
            
            
            
            CABasicAnimation *bigCloudAnimation = [CABasicAnimation animation];
            bigCloudAnimation.repeatCount = 1000;
            bigCloudAnimation.duration = 2;
            bigCloudAnimation.autoreverses = YES;
            bigCloudAnimation.fromValue = @0;
            bigCloudAnimation.toValue = @25;
            bigCloudAnimation.keyPath = @"transform.translation.x";
            [yunView.layer addAnimation:bigCloudAnimation forKey:@"bigCloudAnimation"];
            
            
            CABasicAnimation *smallCloudAnimation = [CABasicAnimation animation];
            smallCloudAnimation.repeatCount = 1000;
            smallCloudAnimation.duration = 2;
            smallCloudAnimation.autoreverses = YES;
            smallCloudAnimation.fromValue = @0;
            smallCloudAnimation.toValue = @-25;
            smallCloudAnimation.keyPath = @"transform.translation.x";
            [littleYunView.layer addAnimation:smallCloudAnimation forKey:@"smallCloudAnimation"];
        
        }
    }
    return cloudView;
}

@end
