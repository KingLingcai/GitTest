//
//  RequestManager.h
//  GitTest
//
//  Created by 孔令才 on 16/8/16.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RequestManager : NSObject

typedef NS_ENUM(NSInteger, RequestMethod) {
    RequestMethodGET,//默认从0开始
    requestMethodPOST,
};

+ (void)request:(NSString *)URL method:(RequestMethod)method parameters:(NSDictionary *)parameters completed:(void (^)(id responseData)) completed failed:(void (^)(NSError *error)) failed;

@end
