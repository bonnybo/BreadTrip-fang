//
//  FujinPlaceModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FujinPlaceModel.h"

@implementation FujinPlaceModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        NSArray *arr = [jsonDic objectForKey:@"hottest_places"];
        if (arr.count != 0) {
            self.photo = [arr[0] objectForKey:@"photo"];
            
        }
        self.photo_count = [jsonDic objectForKey:@"photo_count"];
    }
    return self;
}

@end
