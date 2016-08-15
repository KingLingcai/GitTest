//
//  ContentCell.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imgView = ({
            UIImageView *imgView = [UIImageView new];
            imgView.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:imgView];
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.contentView);
                make.height.equalTo(self.contentView).multipliedBy(0.7);
            }];
            imgView;
        });
        
        self.textLabel = ({
            UILabel *label = [UILabel new];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:20];
            label.backgroundColor = [UIColor purpleColor];
            [self.contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgView.mas_bottom);
                make.left.right.equalTo(self.contentView);
                make.height.equalTo(self.contentView).multipliedBy(0.3);
            }];
            label;
        });
    }
    return self;
}

@end
