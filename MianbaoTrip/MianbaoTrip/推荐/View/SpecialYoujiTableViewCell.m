//
//  SpecialYoujiTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "SpecialYoujiTableViewCell.h"

@implementation SpecialYoujiTableViewCell

- (void)awakeFromNib {
    _imgView.layer.cornerRadius = 10.0;
    _imgView.layer.masksToBounds = YES;
}


-(void)setType5Model:(Type5Model *)type5Model
{
    if (_type5Model != type5Model) {
        _type5Model = type5Model;
        [self setNeedsLayout];
    }
}

- (void)setType7Model:(Type7Model *)type7Model
{
    if (_type7Model != type7Model) {
        _type7Model = type7Model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.type5Model != nil) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.type5Model.cover]];
        _titleLabel.text = self.type5Model.cover_title;
        _subTitleLabel.text = self.type5Model.cover_sub_title;
    }else if (self.type7Model != nil){
        
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.type7Model.cover]];
        _titleLabel.text = self.type7Model.title;
        _subTitleLabel.text = self.type7Model.sub_title;
    }
}

@end
