//
//  ContentCell.h
//  GitTest
//
//  Created by 孔令才 on 16/8/11.
//  Copyright © 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "CourseModel.h"
@interface ContentCell : UICollectionViewCell

@property (nonatomic, strong)   UIImageView *imgView;
@property (nonatomic, strong)   UILabel     *textLabel;
@property (nonatomic, strong)   CourseModel *contents;

@end
