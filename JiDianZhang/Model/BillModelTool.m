//
//  BillModelTool.m
//  JiDianZhang
//
//  Created by gozap on 2019/7/5.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "BillModelTool.h"
#import "BillModel.h"
#import "FMDB.h"
#import "DateFormatter.h"

@implementation BillModelTool
static FMDatabaseQueue *_queue;

+ (void)initialize{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentFolderPath = [searchPaths objectAtIndex:0];
    NSString *path  = [documentFolderPath stringByAppendingPathComponent:@"JiDianZhang.sqlite"];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isExist = [fm fileExistsAtPath:path];
    if (!isExist){
        NSString *backupDbPath = [[NSBundle mainBundle]pathForResource:@"JiDianZhang.sqlite" ofType:nil];
        [fm copyItemAtPath:backupDbPath toPath:path error:nil];
    }
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
}

+(NSMutableArray *)queryWithTime{
    __block BillModel * dataTime;
    __block NSMutableArray *diaryArray = nil;
    [_queue inDatabase:^(FMDatabase *db){
        diaryArray = [NSMutableArray array];
        FMResultSet *rs = nil;
        rs = [db executeQuery:@"select * from Bill_Tab"];
        while (rs.next){
            dataTime = [[BillModel alloc]init];
            dataTime.ids = [rs intForColumn:@"ids"];
            dataTime.amount = [rs stringForColumn:@"amount"];
            dataTime.content = [rs stringForColumn:@"content"];
            dataTime.time = [rs stringForColumn:@"time"];
            dataTime.category = [rs stringForColumn:@"category"];
            dataTime.iconTypeId = [rs stringForColumn:@"iconTypeId"];
            [diaryArray addObject:dataTime];
        }
    }];
    return diaryArray;
}

+(NSMutableDictionary *)queryWithCurrentMonthTime{
    __block BillModel * dataTime;
    __block NSMutableDictionary * dictionary = nil;
    [_queue inDatabase:^(FMDatabase *db){
        dictionary = [NSMutableDictionary new];
        FMResultSet *rs = nil;
        rs = [db executeQuery:@"select * from Bill_Tab"];
        while (rs.next){
            dataTime = [[BillModel alloc]init];
            dataTime.ids = [rs intForColumn:@"ids"];
            dataTime.amount = [rs stringForColumn:@"amount"];
            dataTime.content = [rs stringForColumn:@"content"];
            dataTime.time = [rs stringForColumn:@"time"];
            dataTime.category = [rs stringForColumn:@"category"];
            dataTime.iconTypeId = [rs stringForColumn:@"iconTypeId"];
            
            NSCalendar *gregorian = [[ NSCalendar alloc ] initWithCalendarIdentifier : NSCalendarIdentifierGregorian];
            unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
            
            //格式化时间
            NSDate *createDate = [DateFormatter dateFromTimeStampString:dataTime.time];
            NSDateComponents* components = [gregorian components:unitFlags fromDate:createDate];
            [components setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
            //格式化现在时间
            NSDateComponents* newDateComponent = [gregorian components:unitFlags fromDate:[NSDate date]];
            [newDateComponent setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];

            if (components.year == newDateComponent.year && components.month == newDateComponent.month) {
                NSMutableArray * array = [dictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)components.day]];
                if (array.count <= 0) {
                    array = [NSMutableArray array];
                }
                [array addObject:dataTime];
                [dictionary setObject:array forKey:[NSString stringWithFormat:@"%ld",(long)components.day]];
            }
        }
    }];
    return dictionary;
}

+(void)deleteTime:(int)ids{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"delete from Bill_Tab where ids = ?", [NSNumber numberWithInt:ids]];
    }];
}

+(void)insertTime:(BillModel *)diaryTime{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"insert into Bill_Tab(amount, content, time, category, iconTypeId) values (?, ?, ?, ?, ?)",diaryTime.amount, diaryTime.content, diaryTime.time, diaryTime.category, diaryTime.iconTypeId];
    }];
}

+(BillModel *)queryOneTime:(int)ids{
    __block BillModel * dataTime;
    [_queue inDatabase:^(FMDatabase *db){
        FMResultSet *rs = nil;
        rs = [db executeQuery:@"select * from Bill_Tab where ids = ?",[NSNumber numberWithInt:ids]];
        while (rs.next){
            dataTime = [[BillModel alloc]init];
            dataTime.ids = [rs intForColumn:@"ids"];
            dataTime.amount = [rs stringForColumn:@"amount"];
            dataTime.content = [rs stringForColumn:@"content"];
            dataTime.time = [rs stringForColumn:@"time"];
            dataTime.category = [rs stringForColumn:@"category"];
            dataTime.iconTypeId = [rs stringForColumn:@"iconTypeId"];
        }
    }];
    return dataTime;
}

+(void)updataTime:(BillModel *)updataTime{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"update Bill_Tab set amount = ? , content = ?, time = ?, category = ? , iconTypeId = ? where ids = ? ;",updataTime.amount, updataTime.content, updataTime.time, updataTime.category, updataTime.iconTypeId, [NSNumber numberWithInt:updataTime.ids]];
    }];
}
@end
