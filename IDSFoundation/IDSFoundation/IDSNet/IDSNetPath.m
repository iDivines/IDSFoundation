//
//  IDSNetPath.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetPath.h"

@implementation IDSNetPath

+ (NSString *)netPathWithType:(IDSNetPathType)type{
    switch (type) {
        case IDSNetPathTypeLogin:
            return @"/login.aspx";
        case IDSNetPathTypeLogout:
            return @"/logout.aspx";
    }
}

@end
