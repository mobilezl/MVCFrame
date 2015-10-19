//
//  DataCacheTool.h
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCacheTool : NSObject

+(void)addArr:(NSArray*)arr andId:(NSString*)idstr;
+(void)addDict:(NSDictionary*)dict andId:(NSString*)idstr;

+(NSArray*)dataWithID:(NSString*)ID;
+(void)deleteWidthId:(NSString*)ID;
@end
