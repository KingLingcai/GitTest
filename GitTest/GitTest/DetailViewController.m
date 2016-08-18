//
//  DetailViewController.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "DetailViewController.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#define kIndexURL @"http://crm.powercreator.com.cn:100"

@interface DetailViewController ()

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UIImageView   *starImgView;
@property (nonatomic, strong) UILabel       *schoolNameLabel;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIButton      *backButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.equalTo(self.view.mas_width).multipliedBy(9.0 / 16.0);
        }];
        imageView;
    });
    
    self.backButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(20);
            make.left.equalTo(self.view).offset(0);
            make.width.equalTo(@51);
            make.height.equalTo(@43);
        }];
        [button setImage:[UIImage imageNamed:@"BackButton"] forState:UIControlStateNormal];
        button;
    });
    
    self.schoolNameLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.top.equalTo(self.imageView.mas_bottom).offset(5);
            make.height.equalTo(@20);
            make.width.equalTo(@100);
        }];
//        label.text = @"内蒙古中学";
        label;
    });
    
    self.starImgView = ({
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@"StarsForeground"];
        [self.view addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.schoolNameLabel);
            make.top.equalTo(self.schoolNameLabel.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(65, 23));
        }];
        imgView;
    });
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",kIndexURL,self.course.picPath];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    self.schoolNameLabel.text = self.course.courseName;
    // Do any additional setup after loading the view.
}

- (void)buttonTouched:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
