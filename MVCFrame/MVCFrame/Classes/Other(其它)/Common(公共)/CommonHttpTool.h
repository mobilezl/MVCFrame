//
//  CommonHttpTool.h
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface CommonHttpTool : AFHTTPSessionManager

+(instancetype) sharedNetworkTools;
@end
