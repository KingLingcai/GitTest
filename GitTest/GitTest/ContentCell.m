//
//  ContentCell.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "ContentCell.h"
#import "UIImageView+WebCache.h"

#define kIndexURL @"http://crm.powercreator.com.cn:100"

@implementation ContentCell

- (void)setContents:(CourseModel *)contents{
    if (!_contents) {
        _contents = contents;
//        NSString *urlString = [NSString stringWithFormat:@"%@%@",kIndexURL,_contents.picPath];
//        [self.imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
//        self.textLabel.text = _contents.courseName;
    }
    NSString *urlString = [NSString stringWithFormat:@"%@%@",kIndexURL,contents.picPath];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    self.textLabel.text = contents.courseName;

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imgView = ({
            UIImageView *imgView = [UIImageView new];
            imgView.tag = 10;
            [self.contentView addSubview:imgView];
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.contentView);
                make.height.equalTo(self.contentView).multipliedBy(0.75);
            }];
            imgView;
        });
        
        self.textLabel = ({
            UILabel *label = [UILabel new];
            label.tag = 20;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:20];
            [self.contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgView.mas_bottom);
                make.left.right.equalTo(self.contentView);
                make.height.equalTo(self.contentView).multipliedBy(0.25);
            }];
            label;
        });
    }
    return self;
}

@end
