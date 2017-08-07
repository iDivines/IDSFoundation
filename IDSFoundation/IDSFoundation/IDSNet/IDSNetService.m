//
//  IDSNetService.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "IDSNetService.h"
#import "IDSNetRequestOperate.h"

@implementation IDSNetService
+ (instancetype)shared{
    static IDSNetService *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[IDSNetService alloc] init];
    });
    return sharedManager;
}

- (void)startRequestWithOperate:(IDSNetRequestOperate *)operate{
    
}
@end
