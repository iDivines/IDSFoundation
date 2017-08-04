//
//  IDSNetRequestOperate.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetRequestOperate.h"
#import "IDSNetService.h"
#import "IDSNetPath.h"

@interface IDSNetRequestOperate()
@property (nonatomic, assign) IDSNetMethod method;
@property (nonatomic, assign) IDSNetPathType pathType;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) void(^beginHandler)();
@property (nonatomic, strong) void(^completeHandler)();
@end

@implementation IDSNetRequestOperate

+ (instancetype)initWithMethod:(IDSNetMethod)method
                      pathType:(IDSNetPathType)pathType
                        params:(NSDictionary *)params
                  beginHandler:(void(^)())beginHandler
               completeHandler:(void(^)(id result))completeHandler{
    IDSNetRequestOperate *operate = [[IDSNetRequestOperate alloc] init];
    operate.method = method;
    operate.pathType = pathType;
    operate.params = params;
    operate.beginHandler = beginHandler;
    operate.completeHandler = completeHandler;
    return operate;
}

@end
