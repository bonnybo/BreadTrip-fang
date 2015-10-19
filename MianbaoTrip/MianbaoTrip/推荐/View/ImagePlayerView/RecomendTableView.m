//
//  RecomendTableView.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "RecomendTableView.h"

@implementation RecomendTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
    
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        self.rowHeight = 190;
    
    }
    return self;
}


-(void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        [self reloadData];
    }
}

#pragma mark---UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"self.data.count:%ld",self.data.count);
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imgBarView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 25, 6, 20)];
    imgBarView.image = [UIImage imageNamed:@"bar.png"];
    imgBarView.layer.cornerRadius = 2.0;
    imgBarView.layer.masksToBounds = YES;

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 200, 40)];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.text = @"精彩游记和专题";
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 15, 200, 40)];
    [view addSubview:imgBarView];
    [view addSubview:label];
    return view;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    根据类型决定用哪个cell
//    NSLog(@"%ld",self.data.count);
    YoujiTypeModel *typeModel = self.data[indexPath.row];
    NSNumber *typeNum =  typeModel.type;
    if ([typeNum integerValue] == 4) {
        NSString *iden = @"normalCell";
        NormallYoujiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (cell==nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NormallYoujiTableViewCell" owner:nil options:nil]lastObject];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        YoujiTypeModel *model = self.data[indexPath.row];
        cell.model = model.youjiModel;
        return cell;
    }else if ([typeNum integerValue] == 5 || [typeNum integerValue] == 7){
        NSString *identifier = @"specialCell";
        SpecialYoujiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell==nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SpecialYoujiTableViewCell" owner:nil options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.typeNum = [typeNum integerValue];
        YoujiTypeModel *model = self.data[indexPath.row];
        
        if ([typeNum integerValue] == 5) {
            cell.type5Model = model.type5Model;
        }else if ([typeNum integerValue] == 7){
            cell.type7Model = model.type7Model;
        }
        return cell;
    }
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}


@end
