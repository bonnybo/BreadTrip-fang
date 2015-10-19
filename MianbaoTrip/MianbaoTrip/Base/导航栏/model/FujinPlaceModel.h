//
//  FujinPlaceModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface FujinPlaceModel : BaseModel
@property (nonatomic, strong) NSNumber *category; //种类
@property (nonatomic, strong) NSNumber *photo_count; //照片数
@property (nonatomic, copy) NSString *photo; //照片
@property (nonatomic, copy) NSString *name; //名称
@property (nonatomic, strong) NSNumber *rating; //评分
@property (nonatomic, strong) NSNumber *rating_users; //评分人数
@property (nonatomic, strong) NSDictionary *impressions; //印象
@property (nonatomic, copy) NSString *place_description; //描述
@property (nonatomic, copy) NSString *address; //地址
@property (nonatomic, copy) NSString *tel; //联系方式
@property (nonatomic, copy) NSString *arrival_type; //到达方式
@property (nonatomic, copy) NSString *opening_time; //开放时间
@property (nonatomic, copy) NSString *recommended_reason; //推荐原因


@end
