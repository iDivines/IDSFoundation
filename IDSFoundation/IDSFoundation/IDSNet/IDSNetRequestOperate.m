//
//  IDSNetRequestOperate.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetRequestOperate.h"
#import "IDSNetPath.h"

@implementation IDSNetRequestOperate
IDSNetRequestOperate *operate;

+ (IDSNetRequestOperate *)operate{
    return operate;
}

+ (instancetype)initWithMethod:(IDSNetMethod)method
                      pathType:(IDSNetPathType)pathType
                        params:(NSDictionary *)params
                  beginHandler:(void(^)())beginHandler
               completeHandler:(void(^)(NSDictionary *result))completeHandler{
    NSURLSessionConfiguration.defaultSessionConfiguration
    return nil;
}
@end
