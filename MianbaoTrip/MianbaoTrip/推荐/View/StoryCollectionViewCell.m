//
//  StoryCollectionViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "StoryCollectionViewCell.h"

@implementation StoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}

- (void)createViews
{
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.width, 100)];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
//    UIImage *img = [UIImage imageNamed:@"Default.png"];
//    imgView.backgroundColor = [UIColor colorWithPatternImage:img];
    [self.contentView addSubview:imgView];
    
    
    addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, imgView.bottom - 20, self.width, 20)];
    addressLabel.font = [UIFont boldSystemFontOfSize:11];
    addressLabel.numberOfLines = 1;
    addressLabel.backgroundColor = [UIColor clearColor];
    addressLabel.textColor = [UIColor whiteColor];
    [imgView addSubview:addressLabel];
    
    textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom, self.width, 65)];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.numberOfLines = 2;
    textLabel.backgroundColor = [UIColor whiteColor];
    textLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:textLabel];
    
    personImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, textLabel.bottom , 30, 30)];
    personImgView.layer.cornerRadius = 15.0;
    personImgView.layer.masksToBounds = YES;
    personImgView.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:personImgView];
    
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(personImgView.right+10, textLabel.bottom , 200, 40)];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:nameLabel];
}

-(void)setModel:(HotListModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
  
    [imgView sd_setImageWithURL:[NSURL URLWithString:_model.index_cover] placeholderImage:[UIImage imageNamed:@"hehe.png"]];
    
    if ([_model.poi isKindOfClass:[NSDictionary class]]) {
        if (_model.poi[@"spot_region"] != nil) {
            addressLabel.text = [NSString  stringWithFormat:@"%@ %@",_model.poi[@"name"],_model.poi[@"spot_region"]];
            
        }else{
            addressLabel.text = _model.poi[@"name"];
        }
        
    }else {
        if (_model.location_alias.length != 0) {
            addressLabel.text = _model.location_alias;
        }else{
            addressLabel.text = nil;
        }
    }

    
    textLabel.text = _model.index_title;
    NSString *imgstr = _model.user[@"avatar_m"];
    [personImgView sd_setImageWithURL:[NSURL URLWithString:imgstr]];
    nameLabel.text = _model.user[@"name"];

    
    
}

@end
