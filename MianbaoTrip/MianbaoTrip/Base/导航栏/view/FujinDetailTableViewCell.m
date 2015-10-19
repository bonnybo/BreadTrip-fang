//
//  FujinDetailTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FujinDetailTableViewCell.h"

@implementation FujinDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self createStarView];
}

- (void)createStarView
{
    self.bgImgView.layer.cornerRadius = 10.0;
    self.bgImgView.layer.masksToBounds = YES;
//    self.imgView.layer.cornerRadius = 0.0;
//    self.imgView.layer.masksToBounds = YES;
    
    _starView = [[StarView alloc]initWithFrame:CGRectMake(self.imgView.right + 5, self.titleLabel.bottom +10, self.titleLabel.width - 25, self.commentLabel.height-5)];
    _starView.rating = 0.1;
    _starView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_starView];
    

}

-(void)setPlaceModel:(FujinModel *)placeModel
{
    if (_placeModel != placeModel) {
        _placeModel = placeModel;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_placeModel.cover] placeholderImage:[UIImage imageNamed:@"hehe.png"]];
    self.titleLabel.text = self.placeModel.name;
    self.subTitleLabel.text = self.placeModel.place_description;
    _starView.rating = [self.placeModel.rating floatValue]*2;

    self.commentLabel.text = [NSString stringWithFormat:@"%@点评", self.placeModel.rating_users];
    CGFloat distance = [self.placeModel.distance floatValue];
    if (distance < 1.0) {
        distance = distance*1000;
         self.goneLabel.text = [NSString stringWithFormat:@"距我%.0fm  /%@人去过",distance,self.placeModel.popularity];
    }else{
        self.goneLabel.text = [NSString stringWithFormat:@"距我%.1fkm  /%@人去过",distance,self.placeModel.popularity];
    }

}


@end
