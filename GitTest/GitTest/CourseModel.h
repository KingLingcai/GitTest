//
//  CourseModel.h
//  GitTest
//
//  Created by 孔令才 on 16/8/18.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject

@property (nonatomic, copy) NSString *courseName;
@property (nonatomic, copy) NSString *courseID;
@property (nonatomic, copy) NSString *picPath;
@property (nonatomic, copy) NSString *fkCatalogID;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *fkCourseMostlyTeacherID;

@end
