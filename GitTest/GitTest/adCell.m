//
//  adCell.m
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import "adCell.h"
#import "BannerModel.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kIndexURL @"http://crm.powercreator.com.cn:100"

@implementation adCell

- (void)setContents:(NSArray *)contents{
    if (!_contents) {
        _contents = contents;
        for (int i = 0; i < 3; ++i) {
            BannerModel *model = _contents[i];
            NSLog(@"%@",model.picURL);
            NSLog(@"%@",_contents);
            UIImageView *imageView = (UIImageView *)[self viewWithTag:10 + i];
            NSString *URLStirng = [NSString stringWithFormat:@"%@%@",kIndexURL,model.picURL];
            NSLog(@"%@",URLStirng);
            [imageView sd_setImageWithURL:[NSURL URLWithString:URLStirng]];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.adScrollView = ({
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.scrollEnabled = YES;
            scrollView.pagingEnabled = YES;
            scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth * 425 / 1280);
            scrollView.contentSize = CGSizeMake(kScreenWidth * 3, kScreenWidth * 425 / 1280);
            [self.contentView addSubview:scrollView];
            for (int i = 0; i < 3; ++i) {
                UIImageView *imageView = [UIImageView new];
                imageView.tag = 10 + i;
                imageView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenWidth * 425 / 1280);
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
