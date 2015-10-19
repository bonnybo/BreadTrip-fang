//
//  UIView+ViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next);
    return nil;
    
}

- (UINavigationController *)navigationController
{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)next;
        }
        next = next.nextResponder;
    } while (next);
    return nil;
    
}

@end
