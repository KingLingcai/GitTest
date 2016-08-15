//
//  adCell.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "adCell.h"
#import "Masonry.h"
@implementation adCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        
        self.adScrollView = ({
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:scrollView];
            [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.equalTo(self.contentView);
                make.width.equalTo(self.contentView);
                make.height.equalTo(self.contentView.mas_width).multipliedBy(9.0/16.0);
            }];
            scrollView;
        });
    
        self.adPageControl = ({
            UIPageControl *pageControl = [UIPageControl new];
            pageControl.numberOfPages = 3;
            [self.contentView addSubview:pageControl];
            [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.adScrollView);
                make.bottom.equalTo(self.adScrollView.mas_bottom).offset(-10);
                make.size.mas_equalTo(CGSizeMake(100, 20));
            }];
            pageControl;
        });
    }
    return self;
}

@end
