//
//  Type5Model.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "Type5Model.h"

@implementation Type5Model

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.type5_id = jsonDic[@"id"];
    }
    return self;
}


@end
