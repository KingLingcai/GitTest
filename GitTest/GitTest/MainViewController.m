//
//  ViewController.m
//  GitTest
//
//  Created by 孔令才 on 16/8/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "MainViewController.h"

#import "AFNetworking.h"
#import "Masonry.h"
#import "RequestManager.h"
#import "UMMobClick/MobClick.h"

#import "adCell.h"
#import "ContentCell.h"
#import "FooterReusableView.h"
#import "HeaderReusableView.h"

#import "MoreViewController.h"
#import "DetailViewController.h"

#import "BannerModel.h"
#import "CourseModel.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kQualityCourseURL @"http://crm.powercreator.com.cn:100/app/getcourse.aspx?&coursetype=3&fkcatalogid=0&fkgradeid=0&fktextbookid=0&ischaracteristiccourse=1&order=courseid%252520desc&pageindex=1&pagesize=0&popedomlist=&state=1&uid=0"
#define kOpenCourseURL @"http://crm.powercreator.com.cn:100/app/getcourse.aspx?&coursetype=3&fkcatalogid=0&fkgradeid=0&fktextbookid=0&ischaracteristiccourse=&order=courseid%252520desc&pageindex=1&pagesize=0&popedomlist=&state=1&uid=0"
#define kBannersURL @"http://crm.powercreator.com.cn:100/APP/GetBanner.aspx"

@interface MainViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UIScrollView      *adScrollView;
@property (nonatomic, strong) UIPageControl     *adPageControl;
@property (nonatomic, strong) NSArray           *bannerModels;
@property (nonatomic, strong) NSArray           *qualityCourses;
@property (nonatomic, strong) NSArray           *openCourses;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [MobClick beginLogPageView:@"mainVC"];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    [MobClick endLogPageView:@"mainVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getBannerModelArray];
    [self getQualityCourses];
    [self getOpenCourses];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20 weight:10];
        label.text = @" PowerCreator";
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(20);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@40);
        }];
        label;
    });
    
    self.collectionView = ({
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[adCell class]
           forCellWithReuseIdentifier:@"adCell"];
        [collectionView registerClass:[ContentCell class]
           forCellWithReuseIdentifier:@"contentCell"];
        [collectionView registerClass:[HeaderReusableView class]
           forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                  withReuseIdentifier:@"headerView"];
        [collectionView registerClass:[FooterReusableView class]
           forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                  withReuseIdentifier:@"footerView"];
        [self.view addSubview:collectionView];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
            make.left.right.equalTo(self.view);
        }];
        collectionView;
    });
}

- (void)getBannerModelArray{
    __weak MainViewController *weakSelf = self;
    [RequestManager request:kBannersURL
                     method:RequestMethodGET
                 parameters:nil
                  completed:^(id responseData) {
                          NSLog(@"%@",responseData);
                          NSMutableArray *bannerArray = [NSMutableArray array];
                          NSArray *tempArray = [NSArray arrayWithArray:responseData];
                          for (NSDictionary *dict in tempArray) {
                              BannerModel *model = [BannerModel new];
                              [model setValuesForKeysWithDictionary:dict];
                              [bannerArray addObject:model];
                          }
                      weakSelf.bannerModels = [bannerArray copy];
                      [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
                  }
                     failed:^(NSError *error) {
                         NSLog(@"%@",error);
                     }];
}

- (void)getQualityCourses{
    __weak MainViewController *weakSelf = self;
    [RequestManager request:kQualityCourseURL
                     method:RequestMethodGET
                 parameters:nil
                  completed:^(id responseData) {
                      NSMutableArray *courseArray = [NSMutableArray array];
                      NSArray *tempArray = [NSArray arrayWithArray:responseData];
                      for (NSDictionary *dict in tempArray) {
                          CourseModel *model = [CourseModel new];
                          [model setValuesForKeysWithDictionary:dict];
                          [courseArray addObject:model];
                      }
                      weakSelf.qualityCourses = [courseArray copy];
                      NSLog(@"3333333333333333333333333333%@",weakSelf.qualityCourses);
                      [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
                  }
                     failed:^(NSError *error) {
                         NSLog(@"%@",error);
                     }];
}

- (void)getOpenCourses{
    __weak MainViewController *weakSelf = self;
    [RequestManager request:kOpenCourseURL
                     method:RequestMethodGET
                 parameters:nil
                  completed:^(id responseData) {
                      NSMutableArray *courseArray = [NSMutableArray array];
                      NSArray *tempArray = [NSArray arrayWithArray:responseData];
                      for (NSDictionary *dict in tempArray) {
                          CourseModel *model = [CourseModel new];
                          [model setValuesForKeysWithDictionary:dict];
                          [courseArray addObject:model];
                      }
                      weakSelf.openCourses = [courseArray copy];
                      NSLog(@"3333333333333333333333333333%@",weakSelf.openCourses);
                      [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:2]];
                  }
                     failed:^(NSError *error) {
                         NSLog(@"%@",error);
                     }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 4;
            break;
        default:
            return 0;
            break;
    }

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        adCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"adCell" forIndexPath:indexPath];
        if (self.bannerModels) {
            cell.contents = self.bannerModels;
        }
        return cell;
    }
    else {
        ContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"contentCell" forIndexPath:indexPath];
        if (self.qualityCourses && indexPath.section == 1) {
            cell.contents = self.qualityCourses[indexPath.row];
        }
        if (self.openCourses && indexPath.section == 2) {
            cell.contents = self.openCourses[indexPath.row];
        }
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.course = (indexPath.section == 1) ? self.qualityCourses[indexPath.row] : self.openCourses[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
    NSLog(@"%f",kScreenWidth);
        return CGSizeMake(kScreenWidth, kScreenWidth * (425.0 / 1280.0));
    }
    else {
        CGFloat itemWidth = (kScreenWidth - 30) / 2;
        CGFloat itemHeight = itemWidth;
        CGSize itemSize = CGSizeMake(itemWidth , itemHeight);
        return itemSize;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
        if (kind == UICollectionElementKindSectionHeader) {
            HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
            if (indexPath.section == 1) {
                headerView.titleLabel.text = @"精品课程";
            }
            else {
                headerView.titleLabel.text = @"公开课程";
            }
            return headerView;
        }
        else if (kind == UICollectionElementKindSectionFooter) {
            FooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
            footerView.button.tag = indexPath.section + 100;
            [footerView.button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
            return footerView;
        }
    return nil;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return section > 0 ? UIEdgeInsetsMake(0, 10, 5, 10) : UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return section > 0 ? CGSizeMake(kScreenWidth, 40) : CGSizeMake(kScreenWidth, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return section > 0 ? CGSizeMake(kScreenWidth, 40) : CGSizeZero;
}

- (void)buttonTouched:(UIButton *)sender{
    NSLog(@"%lu",sender.tag);
    MoreViewController *moreVC = [MoreViewController new];
    moreVC.courses = (sender.tag == 101) ? self.qualityCourses : self.openCourses;
    [self.navigationController pushViewController:moreVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
