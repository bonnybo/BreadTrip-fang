//
//  DetailStoryTableView.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DetailStoryTableView.h"

@implementation DetailStoryTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame  style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        
        [self createCloud];
//        创建头视图
//        [self initHeaderView];
//        [self initFooterView];
    }
    return self;
}

- (void)createCloud
{
    yunView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 80)/2, (kScreenHeight-50-49-64)/2, 80, 50)];
    yunView.image = [UIImage imageNamed:@"yun.png"];
    
    littleYunView = [[UIImageView alloc]initWithFrame:CGRectMake(yunView.right-15, yunView.top+10, 60, 40)];
    littleYunView.image = [UIImage imageNamed:@"yun.png"];
    [self addSubview:yunView];
    [self insertSubview:littleYunView belowSubview:yunView];

    CABasicAnimation *bigCloudAnimation = [CABasicAnimation animation];
    bigCloudAnimation.repeatCount = 1000;
    bigCloudAnimation.duration = 2;
    bigCloudAnimation.autoreverses = YES;
    bigCloudAnimation.fromValue = @0;
    bigCloudAnimation.toValue = @25;
    bigCloudAnimation.keyPath = @"transform.translation.x";
    [yunView.layer addAnimation:bigCloudAnimation forKey:@"bigCloudAnimation"];
    
    
    CABasicAnimation *smallCloudAnimation = [CABasicAnimation animation];
    smallCloudAnimation.repeatCount = 1000;
    smallCloudAnimation.duration = 2;
    smallCloudAnimation.autoreverses = YES;
    smallCloudAnimation.fromValue = @0;
    smallCloudAnimation.toValue = @-25;
    smallCloudAnimation.keyPath = @"transform.translation.x";
    [littleYunView.layer addAnimation:smallCloudAnimation forKey:@"smallCloudAnimation"];
    

}
- (void)removeAnnimation
{
    [yunView.layer removeAnimationForKey:@"bigCloudAnimation"];
    [littleYunView.layer removeAnimationForKey:@"smallCloudAnimation"];
    yunView.hidden = YES;
    littleYunView.hidden = YES;
}

- (void)initHeaderView
{
//    头视图背景
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    headerView.backgroundColor=  [UIColor clearColor];
//    头像
    personImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 70, 70)];
    personImg.layer.cornerRadius = 35.0;
    personImg.layer.masksToBounds = YES;
//    名字
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(personImg.right+10, 25, 200, 30)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont systemFontOfSize:20];
    
//    地点
    storyLabel = [[UILabel alloc]initWithFrame:CGRectMake(personImg.right+10, nameLabel.bottom+5, 80, 30)];
    storyLabel.font = [UIFont systemFontOfSize:14];
    storyLabel.textColor = [UIColor grayColor];
    storyLabel.backgroundColor = [UIColor clearColor];
    storyLabel.text = @"故事发生在";
    addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(storyLabel.right, nameLabel.bottom+5, 200, 30)];
    addressLabel.font = [UIFont systemFontOfSize:14];
    addressLabel.textColor = [UIColor redColor];
    addressLabel.backgroundColor = [UIColor clearColor];
    
    [headerView addSubview:storyLabel];
    [headerView addSubview:addressLabel];
    [headerView addSubview:nameLabel];
    [headerView addSubview:personImg];
    
    self.tableHeaderView = headerView;
}

- (void)initFooterView
{
    footerView = [[[NSBundle mainBundle]loadNibNamed:@"DetailTBFooterView" owner:nil options:nil]lastObject];
    self.tableFooterView = footerView;
}

- (void)setSpot_id:(NSString *)spot_id
{
    if (_spot_id != spot_id) {
        _spot_id = spot_id;
        [self requestData];
    }
}
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSLog(@"%@",_spot_id);
    NSLog(@"hehe");
    [params setObject:_spot_id forKey:@"spot_id"];
    
    [DataService requestWithURL:kDeatilSpot
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     [self removeAnnimation];
                     [self initHeaderView];
                     [self initFooterView];
                     //                     解析数据
                     //装的中间的具体内容
                     NSDictionary *data = result[@"data"];
                     NSArray *detail_list = data[@"spot"][@"detail_list"];
                     _data = [NSMutableArray array];
                     for (NSDictionary *dic in detail_list) {
                         StoryDetailListModel *listModel = [[StoryDetailListModel alloc]initContentWithDic:dic];
                         [_data addObject:listModel];
                     }
                     
                     
                     
                     //    其他内容
                     //  内容头
                     NSDictionary *spotDic = data[@"spot"];
                     if ([[spotDic allKeys]containsObject:@"text"]) {
                         text = data[@"spot"][@"text"];
                     }else{
                         text = nil;
                     }
                     
//                  安居古镇
                     if ([data[@"spot"][@"poi"] isKindOfClass:[NSDictionary class]]) {
                         NSString *poi_name = data[@"spot"][@"poi"][@"name"];
                         addressLabel.text = poi_name;
                         
                     }else{
                         addressLabel.text = nil;
                         storyLabel.text = @"";
                         nameLabel.top += 15;
                     }
                     

//                头像
                     NSString *avatar_l = data[@"trip"][@"user"][@"avatar_l"];
                      [personImg sd_setImageWithURL:[NSURL URLWithString:avatar_l]];
//                     昵称
                     NSString *user_name = data[@"trip"][@"user"][@"name"];
                     nameLabel.text = user_name;
                     
//                     footerView的数据
//                     尚未分组的故事
                     NSString *trip_name = data[@"trip"][@"name"];
//                     日期
                     NSString *trip_date = data[@"trip"][@"date_added"];
//                     3人喜欢
                     NSArray *recommendations = data[@"spot"][@"recommendations"];
                      _usersArr = [NSMutableArray array];
                      for (NSDictionary *dic in recommendations) {
                          UserModel *userModel = [[UserModel alloc]initContentWithDic:dic];
                          [_usersArr addObject:userModel];
                      }
                     NSArray *footerArr = [NSArray array];
                     footerArr = @[trip_name,trip_date,recommendations,_usersArr];
                     footerView.data = footerArr;
                     
    //                  评论
//                      NSArray *comments = data[@"spot"][@"comments"];
    //                  刷新数据
                    [self reloadData];
                     } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                         NSLog(@"%@",error);
                     }];
}



#pragma mark---UITableViewDataSource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        if (text == nil) {
            return 0;
        }else{
            NSLog(@"%@",text);
           CGRect rect = [text boundingRectWithSize:CGSizeMake(355, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]} context:nil];
           CGFloat height = rect.size.height+30;
          
           return height;
        }
    }else if(indexPath.row > 0){
        
       StoryDetailListModel *listModel = _data[indexPath.row-1];
        NSInteger height = 0;
        NSInteger height_2 = 355 / [listModel.photo_width doubleValue] * [listModel.photo_height doubleValue];
        CGRect rect = [listModel.text boundingRectWithSize:CGSizeMake(340, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]} context:nil];
        NSInteger height_1 = rect.size.height;
        //    计算label的高度
        height = height_1 + height_2;
        return height+ 20;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.font = [UIFont systemFontOfSize:19];
        if (text == nil) {
            cell.textLabel.text = nil;
            titleLabel.frame = CGRectZero;
            cell.height = 0;
            cell.backgroundColor = [UIColor cyanColor];
        }else{
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.text =text;
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }
        return cell;
    }else{
        NSString *identifier = @"CEll";
        DetailStoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[DetailStoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.storyListModel = _data[indexPath.row-1];
        return cell;
    }
    return nil;
}


@end
