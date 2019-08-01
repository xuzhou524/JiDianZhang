//
//  BillModelTool.h
//  JiDianZhang
//
//  Created by gozap on 2019/7/5.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BillModel;

@interface BillModelTool : NSObject
+(NSMutableArray *)queryWithTime;

+(NSMutableDictionary *)queryWithCurrentMonthTime;
+(NSMutableDictionary *)queryWithAllMonthTime;

+(void)deleteTime:(int)ids;

+(void)insertTime:(BillModel *)diaryTime;

+(BillModel *)queryOneTime:(int)ids;

+(void)updataTime:(BillModel *)updataTime;
@end
