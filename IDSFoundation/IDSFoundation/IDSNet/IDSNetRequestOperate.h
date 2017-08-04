//
//  IDSNetRequestOperate.h
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IDSNetMethod){
    get,
    post,
    put,
    delete
};

@interface IDSNetRequestOperate : NSObject
@property (class, strong, nonatomic) IDSNetRequestOperate *opearte;
@end
