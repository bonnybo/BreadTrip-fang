//
//  DetailStoryTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DetailStoryTableViewCell.h"

#define photoscale(width, height)  (355 / width * height)

@implementation DetailStoryTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createViews];
        
    }
    return  self;
}

- (void)awakeFromNib {
    // Initialization code
    [self createViews];
}

-(void)setModel:(StoryDetailListModel *)storyListModel
{
    if (_storyListModel != storyListModel) {
        _storyListModel = storyListModel;
        [self setNeedsLayout];
    }
}

//创建视图
- (void)createViews
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_imgView];
    

    _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _descriptionLabel.numberOfLines = 0;
    _descriptionLabel.textColor = [UIColor darkGrayColor];
    _descriptionLabel.font = [UIFont systemFontOfSize:14];
    _descriptionLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_descriptionLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //    计算图片的宽高
    _imgView.left = 0;
    _imgView.top = 30;
    _imgView.width = 355;

    _imgView.frame = CGRectMake(0, 30, 355, photoscale([self.storyListModel.photo_width doubleValue], [self.storyListModel.photo_height doubleValue]));
    [_imgView sd_setImageWithURL:[NSURL URLWithString:self.storyListModel.photo_1600] placeholderImage:[UIImage imageNamed:@"hehe.png"]];
//    _imgView.height = [self.storyListModel.photo_height floatValue]*355/1024+70;

    _descriptionLabel.text = self.storyListModel.text;
    _descriptionLabel.width = 345;
    _descriptionLabel.top = _imgView.bottom+5;
    _descriptionLabel.left = 5;
    
    CGRect rect = [_descriptionLabel.text boundingRectWithSize:CGSizeMake(340, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]} context:nil];
    _descriptionLabel.height = rect.size.height;
    _descriptionLabel.frame = CGRectMake(5, _imgView.bottom + 10, 345,rect.size.height );
//    计算label的高度
    self.height = _imgView.height + _descriptionLabel.height+10;
}

@end
