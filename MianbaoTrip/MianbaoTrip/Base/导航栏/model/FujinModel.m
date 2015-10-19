//
//  FujinModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FujinModel.h"

@implementation FujinModel
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.place_description = [jsonDic objectForKey:@"description"];
        self.place_id = [jsonDic objectForKey:@"id"];
        
    }
    return self;
}
@end
