//
//  IDSNetService.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetService.h"
#import "IDSNetRequestOperate.h"
#import "IDSNetPath.h"
#import <AFNetworking/AFNetworking.h>

@interface IDSNetService()
@property (nonatomic, strong) dispatch_queue_t requestQueue;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSDictionary *pathKeyTaskDic;
@property (nonatomic, strong) NSDictionary *operatesDic;
@end

@implementation IDSNetService
+ (instancetype)shared{
    static IDSNetService *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[IDSNetService alloc] init];
        //顺序队列
        sharedManager.requestQueue = dispatch_queue_create("com.iDivines.requestQueue", DISPATCH_QUEUE_SERIAL);
    });
    return sharedManager;
}

- (void)startRequestWithOperate:(IDSNetRequestOperate *)operate{
    switch (operate.method) {
        case GET:
            
            break;
        case POST:
            
            break;
        case PATCH:
            
            break;
        case PUT:
            
            break;
        case DELETE:
            
            break;
            
        default:
            break;
    }
}

@end
