//
//  LoginViewController.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *bgImgView;
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *rememberPasswordButton;
@property (nonatomic, strong) UIButton *autoLoginButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bgImgView = ({
        UIImageView *imgView = [UIImageView new];
        [self.view addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        imgView.image = [UIImage imageNamed:@"LoginBackground"];
        imgView;
    });
    
    self.userTextField = ({
        UITextField *textField = [UITextField new];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"请输入用户名...";
        textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [self.view addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view.mas_centerY).offset(35);
            make.height.equalTo(@25);
            make.width.equalTo(self.view).multipliedBy(0.6);
        }];
        textField;
    });
    
    self.passwordTextField = ({
        UITextField *textField = [UITextField new];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"请输入密码...";
        textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [self.view addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.userTextField.mas_bottom).offset(10);
            make.height.equalTo(@25);
            make.width.equalTo(self.view).multipliedBy(0.6);
        }];
        textField;
    });
    
    self.rememberPasswordButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 10;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.passwordTextField.mas_left);
            make.top.equalTo(self.passwordTextField.mas_bottom).offset(5);
            make.height.equalTo(@20);
            make.width.equalTo(@100);
        }];
        [button setImage:[UIImage imageNamed:@"Mark"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"Marked"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"  记住密码" forState:UIControlStateNormal];
        button;
    });
    
    self.autoLoginButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 11;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.passwordTextField.mas_right);
            make.top.equalTo(self.passwordTextField.mas_bottom).offset(5);
            make.height.equalTo(@20);
            make.width.equalTo(@100);
        }];
        [button setImage:[UIImage imageNamed:@"Mark"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"Marked"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"  自动登陆" forState:UIControlStateNormal];
        button;
    });
    
    self.loginButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 12;
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.clipsToBounds = YES;
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor grayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rememberPasswordButton.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.width.equalTo(@100);
            make.height.equalTo(@30);
        }];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"登 陆" forState:UIControlStateNormal];
        button;
    });
    
    self.backButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 13;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.loginButton.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@30);
        }];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:@"精彩内容,先睹为快 >" forState:UIControlStateNormal];
        button;
    });


    // Do any additional setup after loading the view.
}

-  (void)buttonTouched:(UIButton *)sender{
    switch (sender.tag) {
        case 10:
            {
                [sender setSelected:!sender.isSelected];
                
            }
            break;
        case 11:
            {
                [sender setSelected:!sender.isSelected];
            }
            break;
        case 12:
            {
            
            }
            break;
        case 13:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            break;

    }
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
