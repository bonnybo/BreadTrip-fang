//
//  CountryTableViewCell.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-29.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "CountryTableViewCell.h"

@implementation CountryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        创建视图
        [self initView];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
    [self initView];
}

//创建视图，
- (void)initView
{
//    创建一个UICollectionView
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowlayout.minimumInteritemSpacing = 5;
    flowlayout.minimumLineSpacing = 10;
    flowlayout.itemSize = CGSizeMake(150, 150);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth - 40, 170*3) collectionViewLayout:flowlayout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"hehe"];
}

- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        [_collectionView reloadData];
    }
}


#pragma mark---代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    如果返回数据大于6，就返回6个，如果但会数据小于等于6，就返回几个
    if (self.data.count > 6) {
        return 6;
    }else{
        return self.data.count;
    }

}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hehe" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.layer.cornerRadius = 10.0;
    cell.layer.masksToBounds = YES;
    
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 160)];
   //    传数据
    imgview.image = nil;
    imgview.backgroundColor = [UIColor redColor];
    
    UILabel *cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, imgview.height - 60, 100, 40)];
    cityLabel.backgroundColor = [UIColor clearColor];
    cityLabel.textColor = [UIColor whiteColor];
    cityLabel.font = [UIFont boldSystemFontOfSize:20];
   
//    传数据
    [imgview addSubview:cityLabel];
    
    NSString *urlstr = self.data[indexPath.row][@"photo"];
    [imgview sd_setImageWithURL:[NSURL URLWithString:urlstr]];
    
    
    [cell.contentView addSubview:imgview];

    return cell;
}



@end
