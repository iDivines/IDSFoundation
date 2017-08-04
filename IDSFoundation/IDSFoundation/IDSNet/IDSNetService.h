//
//  IDSNetService.h
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IDSNetMethod){
    GET,
    POST,
    PUT,
    PATCH,
    DELETE
};

@interface IDSNetService : NSObject

@end
