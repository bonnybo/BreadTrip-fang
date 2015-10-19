//
//  UserModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.user_id = jsonDic[@"id"];
    }
    return self;
}


@end
