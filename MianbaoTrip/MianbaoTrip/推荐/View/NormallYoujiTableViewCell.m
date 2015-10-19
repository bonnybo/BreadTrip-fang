//
//  NormallYoujiTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "NormallYoujiTableViewCell.h"

@implementation NormallYoujiTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    NSLog(@"awakeFromNib");
    
    imgView.layer.cornerRadius = 10.0;
    imgView.layer.masksToBounds = YES;
    userImgView.layer.cornerRadius = 15.0;
    userImgView.layer.masksToBounds = YES;
    barView.layer.cornerRadius = 2.0;
    barView.layer.masksToBounds = YES;
    
}

//- (void)setData:(NSDictionary *)data
//{
//    if (_data != data) {
//        _data = data;
//        [self setNeedsLayout];
//    }
//}

- (void)setModel:(YoujiModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    

    NSString *title = self.model.index_title;
    if (title.length == 0) {
        title = self.model.name;
    }
    titleLabel.text = title;
    
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:self.model.cover_image_w640]];
    timeLabel.text = [NSString stringWithFormat:@"%@  %@天 %@次浏览",self.model.first_day, self.model.day_count,self.model.view_count];
    cityLabel.text = self.model.popular_place_str;
    [userImgView sd_setImageWithURL:[NSURL URLWithString:self.model.userModel.avatar_m]];
    userNameLabel.text = self.model.userModel.name;
    
}
@end
