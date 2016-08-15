//
//  FooterReusableView.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "FooterReusableView.h"
#import "masonry.h"
@implementation FooterReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView *view = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor blackColor];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.equalTo(self);
                make.height.equalTo(@2);
            }];
            view;
        });
        
        self.button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"查看更多" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithWhite:0.3 alpha:0.8] forState:UIControlStateNormal];
            [self addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.bottom.equalTo(self);
                make.width.equalTo(@200);
            }];
            button;
        });
    }
    return self;
}

@end
