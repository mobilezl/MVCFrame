//
//  DataCacheTool.m
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//

#import "DataCacheTool.h"
static FMDatabaseQueue *_queue;
@implementation DataCacheTool


+(void) initialize
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"news.sqlite"];
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    //创建表
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL b = [db executeUpdate:@"create table if not exists info(ID integer primary key autoincrement,data blob,idstr text)"];
        if(!b){
            NSLog(@"创建表失败");
        }
    }];
    
}

//循环新增
+(void)addArr:(NSArray *)arr andId:(NSString *)idstr
{
    for (NSDictionary *dict in arr) {
        [self addDict:dict andId:idstr];
    }
}

//新增数据
+(void)addDict:(NSDictionary *)dict andId:(NSString *)idstr
{
    [_queue inDatabase:^(FMDatabase *db) {
        NSDate *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
        [db executeUpdate:@"insert into info(data,idstr) values(?,?)",data,idstr];
    }];
}

//返回数组
+(NSArray *)dataWithID:(NSString *)ID
{
    __block NSMutableArray * arr = nil;
    [_queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"select * form info where idstr=?",ID];
        if(result){
            arr = [NSMutableArray array];
            while ([result next]) {
                NSDate *data = [result dataForColumn:@"data"];
                 // NSString *idstr=[result stringForColumn:@"idstr"];
                
                //转成字典
                NSDictionary *dict=[NSKeyedUnarchiver unarchiveObjectWithData:data];
                [arr addObject:dict];
            }
        }
    }];
    
    return arr;
}

#pragma mark 删除对于数据
+(void)deleteWidthId:(NSString *)ID
{
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL b = [db executeUpdate:@"delete from info where idstr=?",ID];
        if(!b){
            NSLog(@"删除失败");
        }
    }];
}





@end
