//
//  DetailTBFooterView.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DetailTBFooterView.h"

@implementation DetailTBFooterView


- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        [self setNeedsLayout];
    }
}


- (void)layoutSubviews
{
    sourceLabel.text = self.data[0];
    timeLabel.text = self.data[1];
//    NSLog(@"hehdedahe:%@",timeLabel.text);
    NSArray *likeArr = self.data[2];
    likeCountLabel.text = [NSString stringWithFormat:@"%ld",likeArr.count];
    NSArray *userModels = self.data[3];
    if (userModels.count == 0) {
        
    }
    for (int i = 0; i < userModels.count; i ++) {
        UserModel *userModel = userModels[i];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60*i, likeCountLabel.bottom+5, 45, 45)];
        [self addSubview:imgView];
        [imgView sd_setImageWithURL:[NSURL URLWithString:userModel.avatar_l]];
        imgView.layer.cornerRadius = 22.5;
        imgView.layer.masksToBounds = YES;
    }
    
    //2015-10-04T11:29:13+08:00
    timeLabel.text = [timeLabel.text stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    timeLabel.text = [timeLabel.text stringByReplacingOccurrencesOfString:@"08:00" withString:@"0800"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
    NSDate *date = [formatter dateFromString:timeLabel.text];
   
    NSDateFormatter *changeFormater = [[NSDateFormatter alloc]init];
    changeFormater.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    [changeFormater setDateFormat:@"yyyy.MM.dd HH:mm"];
    timeLabel.text = [changeFormater stringFromDate:date];


    
    
    
}



@end
