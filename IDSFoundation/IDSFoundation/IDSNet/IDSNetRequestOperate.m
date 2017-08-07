//
//  IDSNetRequestOperate.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetRequestOperate.h"
#import "IDSNetService.h"

@interface IDSNetRequestOperate()
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) void(^beginHandler)();
@property (nonatomic, strong) void(^completeHandler)();
@end

@implementation IDSNetRequestOperate

+ (instancetype)operateWithMethod:(IDSNetMethod)method
                         pathType:(IDSNetPathType)pathType
                           params:(NSDictionary *)params
                     beginHandler:(void(^)())beginHandler
                  completeHandler:(void(^)(id result))completeHandler{
    return [[IDSNetRequestOperate alloc] initWithMethod:method
                                               pathType:pathType
                                                 params:params
                                           beginHandler:beginHandler
                                        completeHandler:completeHandler];
}

- (instancetype)initWithMethod:(IDSNetMethod)method
                      pathType:(IDSNetPathType)pathType
                        params:(NSDictionary *)params
                  beginHandler:(void(^)())beginHandler
               completeHandler:(void(^)(id result))completeHandler{
    if(self = [super init]){
        _method = method;
        _pathType = pathType;
        _params = params;
        _beginHandler = beginHandler;
        _completeHandler = completeHandler;
    }
    return self;
}

- (void)fly{
    [IDSNetService.shared startRequestWithOperate:self];
}

#pragma makr - helper

- (NSString *)path{
    return [IDSNetPath netPathWithType:self.pathType];
}

@end
