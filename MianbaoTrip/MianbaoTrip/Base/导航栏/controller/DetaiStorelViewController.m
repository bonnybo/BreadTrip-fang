//
//  DetaiStorelViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DetaiStorelViewController.h"
#import "StarView.h"
@interface DetaiStorelViewController ()
{
    StarView *_starView;
}
@end

@implementation DetaiStorelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"详情界面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    personImgView.layer.cornerRadius = 25.0;
    personImgView.backgroundColor = [UIColor whiteColor];
    personImgView.layer.masksToBounds = YES;
    
    
    _starView = [[StarView alloc]initWithFrame:CGRectMake(90, _nameLabel.bottom +13, 40, 20)];
    if (_starView.rating == 0 ) {
        _starView.rating = 0.1;
    }
    _starView.rating = self.rating * 2;
    _starView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_starView];
    
    if (self.comment_count == 0) {
        commentLabel.text = [NSString stringWithFormat:@"0用户点评"];
    }else{
        commentLabel.text = [NSString stringWithFormat:@"%ld用户点评",self.comment_count];
    }
    
    descriptionLabel.text = self.place_description;
    _nameLabel.text = self.name;
    personImgView.image = [UIImage imageNamed:@"person.png"];
    [self requestData];
}

- (void)requestData
{

    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",kPlace_detail,self.place_id];
    [DataService requestWithURL:urlStr
                         params:nil
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     
                     NSArray *hottest_places = result[@"hottest_places"];
                     if (hottest_places.count == 0) {
                         bgImgView.image = [UIImage imageNamed:@"beauti.png"];
                     }else{
                         NSString *photo = hottest_places[0][@"photo"];
                         [bgImgView sd_setImageWithURL:[NSURL URLWithString:photo]];
                     }
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     
                 }];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    橡皮筋效果
    
}



@end
