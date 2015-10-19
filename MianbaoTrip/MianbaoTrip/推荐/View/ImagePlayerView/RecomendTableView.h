//
//  RecomendTableView.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormallYoujiTableViewCell.h"
#import "SpecialYoujiTableViewCell.h"
#import "YoujiModel.h"
#import "YoujiTypeModel.h"
#import "Type5Model.h"
#import "Type7Model.h"

@interface RecomendTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *data;
@end
