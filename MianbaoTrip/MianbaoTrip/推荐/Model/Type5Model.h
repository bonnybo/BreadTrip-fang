//
//  Type5Model.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface Type5Model : BaseModel


@property (nonatomic,copy) NSString *icon_type;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *cover_sub_title;
@property (nonatomic,strong) NSNumber *comment_count;
@property (nonatomic,strong) NSNumber *like_count;
@property (nonatomic,copy) NSString *cover_title;
@property (nonatomic,copy) NSString *app5_cover_url;
@property (nonatomic,copy) NSString *type5_id;
@property (nonatomic,copy) NSString *cover_mask;

@end
