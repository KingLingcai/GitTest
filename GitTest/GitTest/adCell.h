//
//  adCell.h
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface adCell : UICollectionViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView      *adScrollView;
@property (nonatomic, strong) UIPageControl     *adPageControl;
@property (nonatomic, copy)   NSString          *imageName;
@property (nonatomic, copy)   NSArray           *contents;
@end
