//
//  CountryDetailViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseViewController.h"
#import "CountryTableViewCell.h"


@interface CountryDetailViewController : SecondBaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    UIView *_headerView;
    UILabel *countryLabel;
    UILabel *goLabel;

    UIButton *backBtn;
    UIButton *loveBtn;
    UIButton *shareBtn;
}


@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *city_id;


@property (nonatomic,strong) NSDictionary *data;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *visited_count;



@end
