//
//  BannerModelManager.m
//  GitTest
//
//  Created by 孔令才 on 16/8/16.
//  Copyright © 2016年 King. All rights reserved.
//

#import "BannerModelManager.h"
#import "BannerModel.h"
#import "RequestManager.h"

#define kBannersURL @"http://crm.powercreator.com.cn:100/APP/GetBanner.aspx"

@implementation BannerModelManager

+ (NSArray *)getBannerModelArray{
    NSMutableArray *bannerArray = [NSMutableArray array];
    [RequestManager request:kBannersURL method:RequestMethodGET parameters:nil completed:^(NSDictionary *responseData) {
        if (responseData) {
            NSLog(@"%@",responseData);
            NSArray *tempArray = [NSArray arrayWithArray:responseData];
            for (NSDictionary *dict in tempArray) {
                BannerModel *model = [BannerModel new];
                [model setValuesForKeysWithDictionary:dict];
                [bannerArray addObject:model];
            }
        }
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    return [bannerArray copy];
}


@end
