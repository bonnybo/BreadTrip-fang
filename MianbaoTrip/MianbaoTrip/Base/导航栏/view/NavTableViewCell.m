//
//  NavTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "NavTableViewCell.h"
#import "BaseNavigationController.h"

@implementation NavTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initCollectionview];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [self _initCollectionview];
}

- (void)_initCollectionview
{
    
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.minimumLineSpacing = 10;
    flowlayout.itemSize = CGSizeMake(90, 30);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 10, kScreenWidth-30, 180) collectionViewLayout:flowlayout];
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.collectionView];
 
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CEll"];
}

#pragma mark --代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr = [self.data objectForKey:@"elements"];
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CEll" forIndexPath:indexPath];
    _cellImg = [[UIImageView alloc]initWithFrame:cell.bounds];
    UIImage *img = [UIImage imageNamed:@"country.png"];
    img = [img stretchableImageWithLeftCapWidth:15.0 topCapHeight:15.0];
    _cellImg.image = img;

    UILabel *label = [[UILabel alloc]initWithFrame:_cellImg.bounds];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [_cellImg addSubview:label];
    _cellImg.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:_cellImg];
//分析数据
    NSArray *arr = [self.data objectForKey:@"elements"];
    _mArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        SearchModel *model = [[SearchModel alloc]initContentWithDic:dic];
        [_mArr addObject:model];
    }
    _model = _mArr[indexPath.row];
    
    label.text = _model.name;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
//    点击触发的方法
    [UIView animateWithDuration:0.3
                     animations:^{
                         UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
                         cell.layer.cornerRadius = 15.0;
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"]];
                                          }completion:^(BOOL finished) {
                                            cell.backgroundColor = [UIColor clearColor];
                                          }];
                     }];
    

    _model = _mArr[indexPath.row];
    CountryDetailViewController *countryDetailVc = [[CountryDetailViewController alloc]init];
    countryDetailVc.city_id = _model.nameId;
    countryDetailVc.type = _model.type;
    countryDetailVc.name = _model.name;

    [self.navigationController pushViewController:countryDetailVc animated:YES];
    
 }



@end
