//
//  ViewController.m
//  GitTest
//
//  Created by 孔令才 on 16/8/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry.h"
@interface MainViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = ({
        UIScrollView *view = [UIScrollView new];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor lightGrayColor];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topLayoutGuide);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.bottom.equalTo(self.bottomLayoutGuide);
        }];
        view;
    });
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
