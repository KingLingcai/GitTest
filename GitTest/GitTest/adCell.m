//
//  adCell.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "adCell.h"
#import "Masonry.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation adCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        
        self.adScrollView = ({
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.scrollEnabled = YES;
            scrollView.pagingEnabled = YES;
            scrollView.backgroundColor = [UIColor grayColor];
            scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth * 9 / 16);
            [self.contentView addSubview:scrollView];
            for (int i = 0; i < 3; ++i) {
                UIImageView *imageView = [UIImageView new];
                imageView.backgroundColor = [UIColor redColor];
                imageView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenWidth * 9 / 16);
                [scrollView addSubview:imageView];
            }
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromUIEdgeInsets(scrollView.contentInset));
}

@end
