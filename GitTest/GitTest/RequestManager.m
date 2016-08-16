//
//  RequestManager.m
//  GitTest
//
//  Created by 孔令才 on 16/8/16.
//  Copyright © 2016年 King. All rights reserved.
//

#import "RequestManager.h"
@interface RequestManager()



@end

@implementation RequestManager

//+ (void):(NSString *)string{
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//    [sessionManager GET:string
//             parameters:nil
//               progress:nil
//                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                    NSLog(@"%@",responseObject);
//                }
//                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                    NSLog(@"%@",error);
//                }];
//}

+ (void)request:(NSString *)URL method:(RequestMethod)method parameters:(NSDictionary *)parameters completed:(void (^)(NSDictionary *))completed failed:(void (^)(NSError *))failed{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    if (method == RequestMethodGET) {
        [sessionManager GET:URL
                 parameters:parameters
                   progress:nil
                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        if (responseObject) {
                            completed(responseObject);
                        }
                    }
                    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        if (error) {
                            NSLog(@"%@",error);
                            failed(error);
                        }
                    }];

    }
}

@end
