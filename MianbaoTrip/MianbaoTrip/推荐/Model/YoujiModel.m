//
//  YoujiModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "YoujiModel.h"

@implementation YoujiModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.youji_id = jsonDic[@"id"];
        self.youji_description = jsonDic[@"description"];
        self.userModel = [[UserModel alloc]initContentWithDic:jsonDic[@"user"]];
    }
    return self;
}

@end
