//
//  BannerModel.m
//  GitTest
//
//  Created by 孔令才 on 16/8/16.
//  Copyright © 2016年 King. All rights reserved.
//

#import "BannerModel.h"
#import "RequestManager.h"



@implementation BannerModel

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    self.ID = [keyedValues valueForKey:@"ID"];
    NSLog(@"%@",self.ID);
    self.title = [keyedValues valueForKey:@"Title"];
    NSLog(@"%@",self.title);
    self.picURL = [keyedValues valueForKey:@"PicUrl"];
    self.redirectURL = [keyedValues valueForKey:@"RedirectUrl"];
    self.bannerIndex = [keyedValues valueForKey:@"BannerIndex"];
}

@end
