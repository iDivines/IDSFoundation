//
//  ViewController.m
//  IDSFoundation
//
//  Created by macmini on 2017/8/4.
//  Copyright © 2017年 macmini. All rights reserved.
//

#import "ViewController.h"
#import "IDSNetRequestOperate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[IDSNetRequestOperate operateWithMethod:GET
                                   pathType:IDSNetPathTypeLogin
                                    relation:cancelBefore
                                     params:@{@"key":@"testS"}
                               beginHandler:^{
                                   //请求开始前的处理
                               } completeHandler:^(IDSNetResult resultType, id result) {
                                   //请求完成
                               }] fly];
}

@end
