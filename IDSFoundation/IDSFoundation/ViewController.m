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
                                     params:@{@"key":@"testS"}
                               beginHandler:^{
                                   //请求开始前的处理，例如：增加一个全屏的遮罩层转圈
                               } completeHandler:^(id result) {
                                   //请求完成后的处理，例如：移除一个全屏的遮罩层转圈，处理结果数据
                               }] fly];
}

@end
