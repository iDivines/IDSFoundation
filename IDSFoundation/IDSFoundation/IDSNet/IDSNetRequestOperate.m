//
//  IDSNetRequestOperate.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetRequestOperate.h"
#import "IDSNetService.h"

@implementation IDSNetRequestOperate

+ (instancetype)operateWithMethod:(IDSNetMethod)method
                         pathType:(IDSNetPathType)pathType
                         relation:(IDSNetRelation)relation
                           params:(NSDictionary *)params
                     beginHandler:(void(^)())beginHandler
                  completeHandler:(void(^)(IDSNetResult resultType, id result))completeHandler{
    return [[IDSNetRequestOperate alloc] initWithMethod:method
                                               pathType:pathType
                                               relation:relation
                                                 params:params
                                           beginHandler:beginHandler
                                        completeHandler:completeHandler];
}

- (instancetype)initWithMethod:(IDSNetMethod)method
                      pathType:(IDSNetPathType)pathType
                      relation:(IDSNetRelation)relation
                        params:(NSDictionary *)params
                  beginHandler:(void(^)())beginHandler
               completeHandler:(void(^)(IDSNetResult resultType, id result))completeHandler{
    if(self = [super init]){
        _method = method;
        _pathType = pathType;
        _relation = relation;
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

- (NSString *)pathKey{
    NSString *md = @"";
    switch (self.method) {
        case GET:
            md = @"GET";
            break;
        case POST:
            md = @"POST";
            break;
        case PATCH:
            md = @"PATCH";
            break;
        case PUT:
            md = @"PUT";
            break;
        case DELETE:
            md = @"DELETE";
            break;
    }
    return [md stringByAppendingFormat:@":%@",self.path];
}

@end
