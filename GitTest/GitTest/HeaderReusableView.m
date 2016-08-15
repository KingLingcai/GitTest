//
//  CollectionReusableView.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "HeaderReusableView.h"
#import "Masonry.h"
@implementation HeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.smallView = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(10);
                make.top.equalTo(self.mas_top).offset(7);
                make.centerY.equalTo(self);
                make.width.equalTo(@5);
            }];
            view;
        });
        
        self.titleLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:20 weight:5];
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.smallView.mas_right).offset(5);
                make.top.right.bottom.equalTo(self);
            }];
            label;
        });
    }
    return self;
}
@end
