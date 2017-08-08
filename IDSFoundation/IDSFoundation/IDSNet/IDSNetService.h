//
//  IDSNetService.h
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IDSNetRequestOperate;

typedef NS_ENUM(NSInteger, IDSNetMethod){
    GET,
    POST,
    PUT,
    PATCH,
    DELETE
};

typedef NS_ENUM(NSInteger, IDSNetRelation){
    cancelBefore, //放弃先前的请求任务与操作；新生成请求任务，响应新操作
    cancelBehind, //放弃后发起的请求操作
    repeatBefore, //继续利用先前发起的请求任务，响应全部操作
    repeatBehind, //取消之前的请求任务；新生成请求任务，响应全部操作
};

typedef NS_ENUM(NSInteger, IDSNetResult){
    success,
    fail,
};

@interface IDSNetService : NSObject
+ (instancetype)shared;
- (void)startRequestWithOperate:(IDSNetRequestOperate *)operate;
@end
