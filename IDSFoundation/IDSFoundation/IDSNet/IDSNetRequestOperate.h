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
@property (nonatomic, readonly, assign) IDSNetMethod method;
@property (nonatomic, readonly, assign) IDSNetPathType pathType;
@property (nonatomic, readonly, assign) IDSNetRelation relation;

@property (nonatomic, readonly, strong) NSDictionary *params;
@property (nonatomic, readonly, strong) void(^beginHandler)();
@property (nonatomic, readonly, strong) void(^completeHandler)(IDSNetResult resultType, id result);

@property (nonatomic, readonly, copy) NSString *path;
@property (nonatomic, readonly, copy) NSString *pathKey;

+ (instancetype)operateWithMethod:(IDSNetMethod)method
                         pathType:(IDSNetPathType)pathType
                         relation:(IDSNetRelation)relation
                           params:(NSDictionary *)params
                     beginHandler:(void(^)())beginHandler
                  completeHandler:(void(^)(IDSNetResult resultType, id result))completeHandler;
- (void)fly;

@end
