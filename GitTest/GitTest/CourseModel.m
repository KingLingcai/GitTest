//
//  CourseModel.m
//  GitTest
//
//  Created by 孔令才 on 16/8/18.
//  Copyright © 2016年 King. All rights reserved.
//

#import "CourseModel.h"

@implementation CourseModel

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    self.courseName = [keyedValues valueForKey:@"CourseName"];
    self.courseID = [keyedValues valueForKey:@"CourseID"];
    self.picPath = [keyedValues valueForKey:@"PicPath"];
    self.fkCatalogID = [keyedValues valueForKey:@"FKCatalogID"];
    self.updateTime = [keyedValues valueForKey:@"Updatetime"];
    self.state = [keyedValues valueForKey:@"state"];
    self.fkCourseMostlyTeacherID = [keyedValues valueForKey:@"FKCourseMostlyTeacherID"];
}

@end
