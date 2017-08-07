//
//  IDSNetRequestOperate.h
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDSNetService.h"
#import "IDSNetPath.h"

@interface IDSNetRequestOperate : NSObject
+ (instancetype)operateWithMethod:(IDSNetMethod)method
                         pathType:(IDSNetPathType)pathType
                           params:(NSDictionary *)params
                     beginHandler:(void(^)())beginHandler
                  completeHandler:(void(^)(id result))completeHandler;
- (void)fly;
@end
