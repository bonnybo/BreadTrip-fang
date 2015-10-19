//
//  YoujiTypeModel.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "YoujiTypeModel.h"

@implementation YoujiTypeModel


-(id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        
        if ([self.type integerValue] == 4) {
            self.youjiModel = [[YoujiModel alloc]initContentWithDic:jsonDic[@"data"][0]];
        }else if ([self.type integerValue] == 5){
            self.type5Model = [[Type5Model alloc]initContentWithDic:jsonDic[@"data"][0]];
        }else if ([self.type integerValue] == 7){
            self.type7Model = [[Type7Model alloc]initContentWithDic:jsonDic[@"data"][0]];
        }
            
    }
    return self;
}


@end
