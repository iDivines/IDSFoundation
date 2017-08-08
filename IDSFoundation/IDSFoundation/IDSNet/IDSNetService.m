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
@property (nonatomic, strong) NSMutableDictionary *pathKeyTaskDic;
@property (nonatomic, strong) NSMutableDictionary *taskOperatesDic;
@end

@implementation IDSNetService
+ (instancetype)shared{
    static IDSNetService *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[IDSNetService alloc] init];
    });
    return sharedManager;
}

- (instancetype)init{
    if(self = [super init]){
        //顺序队列
        _requestQueue = dispatch_queue_create("com.iDivines.requestQueue", DISPATCH_QUEUE_SERIAL);
        _sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[self configuration]];
        
        _pathKeyTaskDic = [NSMutableDictionary dictionary];
        _taskOperatesDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSURLSessionConfiguration *)configuration{
    NSURLSessionConfiguration *cfg = NSURLSessionConfiguration.defaultSessionConfiguration;
    cfg.timeoutIntervalForRequest = 60;
    cfg.timeoutIntervalForRequest = 60;
    cfg.HTTPAdditionalHeaders = [self httpAdditionalHeaders];
    return cfg;
}

- (NSDictionary *)httpAdditionalHeaders{
    //TODO:填写请求头
    return nil;
}

- (void)startRequestWithOperate:(IDSNetRequestOperate *)operate{
    
    dispatch_async(_requestQueue, ^{
        NSURLSessionTask *newTask;
        NSMutableArray *sameOperates = [NSMutableArray array];
        
        NSURLSessionTask *preTask = self.pathKeyTaskDic[operate.pathKey];
        [self.pathKeyTaskDic removeObjectForKey:operate.pathKey];
        
        if(preTask){
            switch (operate.relation) {
                case cancelBefore:
                {
                    IDSNetRequestOperate *op = [(NSArray *)(self.taskOperatesDic[@(preTask.taskIdentifier)]) firstObject];
                    if(op){
                        [self.taskOperatesDic removeObjectForKey:@(preTask.taskIdentifier)];
                        [preTask cancel];
                        if(op.completeHandler){
                            NSError *error = nil;
                            op.completeHandler(fail, error);
                        }
                    }
                }
                    break;
                case cancelBehind:
                {
                    IDSNetRequestOperate *op = [(NSArray *)(self.taskOperatesDic[@(preTask.taskIdentifier)]) firstObject];
                    if(op){
                        [self.taskOperatesDic removeObjectForKey:@(preTask.taskIdentifier)];
                        if(op.completeHandler){
                            NSError *error = nil;
                            op.completeHandler(fail, error);
                        }
                        sameOperates = [NSMutableArray arrayWithObjects:op, nil];
                        return;
                    }
                }
                    
                    break;
                case repeatBefore:
                    
                    break;
                case repeatBehind:
                    
                    break;
            }
        }else{
            [sameOperates addObject:preTask];
        }
        
        //回调beginHandler
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(operate.beginHandler){
                operate.beginHandler();
            }
        });
        
        switch (operate.method) {
            case GET:
            {
                newTask = [self.sessionManager GET:operate.path
                                        parameters:operate.params
                                          progress:nil
                                           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                               [self handleSuccessTask:task response:responseObject];
                                           }
                                           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                               [self handelFailureTask:task error:error];
                                           }];
            }
                break;
            case POST:
                //TODO:实现post请求
                break;
            default:
                break;
        }
        if
        self.taskOperatesDic[@(newTask.taskIdentifier)] = sameOperates;
    });
}

- (void)handleSuccessTask:(NSURLSessionTask *)task response:(id)response{
    dispatch_async(self.requestQueue, ^{
        [self.taskOperatesDic removeObjectForKey:@(task.taskIdentifier)];
        [self.taskOperatesDic enumerateKeysAndObjectsUsingBlock:^(NSNumber* key, NSArray* array, BOOL * _Nonnull stop) {
            [array enumerateObjectsUsingBlock:^(IDSNetRequestOperate *op, NSUInteger idx, BOOL * _Nonnull stop) {
                if(op.completeHandler){
                    op.completeHandler(success, response);
                }
            }];
        }];
    });
}

- (void)handelFailureTask:(NSURLSessionTask *)task error:(NSError * _Nonnull)error{
    dispatch_async(self.requestQueue, ^{
        [self.taskOperatesDic removeObjectForKey:@(task.taskIdentifier)];
        [self.taskOperatesDic enumerateKeysAndObjectsUsingBlock:^(NSNumber* key, NSArray* array, BOOL * _Nonnull stop) {
            [array enumerateObjectsUsingBlock:^(IDSNetRequestOperate *op, NSUInteger idx, BOOL * _Nonnull stop) {
                if(op.completeHandler){
                    op.completeHandler(fail, error);
                }
            }];
        }];
    });
}

@end
