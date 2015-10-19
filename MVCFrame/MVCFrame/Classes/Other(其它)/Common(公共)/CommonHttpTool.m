//
//  CommonHttpTool.m
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//

#import "CommonHttpTool.h"

@implementation CommonHttpTool

+(instancetype)sharedNetworkTools
{
    static CommonHttpTool *httpTool;
    static dispatch_once_t onceToken;
    //单列
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        httpTool = [[self alloc] initWithBaseURL:url sessionConfiguration:config];
        httpTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return  httpTool;

}
@end
