//
//  MainTabBarController.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabbarItem.h"

@interface MainTabBarController : UITabBarController
{
    BOOL isRo;
    UIImageView *addView;
    UIImageView *firstView;
//     UIImageView *secondView;
    UIImageView *secondView;
    UIView *bgView;
}
- (void)hideAnimation;
@end
