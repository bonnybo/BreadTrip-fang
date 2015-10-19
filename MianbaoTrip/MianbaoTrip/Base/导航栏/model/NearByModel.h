//
//  NearByModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface NearByModel : BaseModel
@property (nonatomic, copy) NSString *name; //名称
@property (nonatomic, copy) NSString *cover_s; //封面
@property (nonatomic, strong) NSNumber *tips_count; //点评人数
@property (nonatomic, strong) NSNumber *rating; //评分
@property (nonatomic, copy) NSString *place_description; //描述
@property (nonatomic, strong) NSNumber *distance; //距离
@property (nonatomic, strong) NSNumber *visited_count; //去过人数
@property (nonatomic, strong) NSNumber *recommended; //是否推荐
@property (nonatomic, strong) NSNumber *place_id; //地点id
@end