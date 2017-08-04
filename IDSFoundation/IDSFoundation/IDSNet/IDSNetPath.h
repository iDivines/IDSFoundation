//
//  IDSNetPath.h
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IDSNetPathType){
    IDSNetPathTypeLogin,
    IDSNetPathTypeLogout
};

@interface IDSNetPath : NSObject
+ (NSString *)netPathWithType:(IDSNetPathType)type;
@end
