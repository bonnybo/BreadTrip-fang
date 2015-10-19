//
//  NearByModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "NearByModel.h"

@implementation NearByModel
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        self.place_description = [jsonDic objectForKey:@"description"];
        NSArray *tips = [jsonDic objectForKey:@"tips"];
        if (tips.count != 0) {
            NSString *str = [tips[0] objectForKey:@"content"];
            self.place_description = str.length == 0? self.place_description : str;
            
        }
        self.place_id = [jsonDic objectForKey:@"id"];
    }
    return self;
}
@end
