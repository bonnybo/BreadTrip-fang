//
//  YoujiTypeModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"
#import "YoujiModel.h"
#import "Type5Model.h"
#import "Type7Model.h"



@interface YoujiTypeModel : BaseModel

@property (nonatomic,strong) NSNumber *type;
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,strong) YoujiModel *youjiModel;
@property (nonatomic,strong )Type5Model *type5Model;
@property (nonatomic,strong )Type7Model *type7Model;

@end
