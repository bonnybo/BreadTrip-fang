//
//  SearchModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.nameId = [jsonDic objectForKey:@"id"];
    }
    return self;
}


@end
