//
//  BillModel.m
//  JiDianZhang
//
//  Created by gozap on 2019/7/5.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "BillModel.h"
#import "BillModelTool.h"

@implementation BillModel
-(NSMutableArray *)queryWithTime{
    return [BillModelTool queryWithTime];
}

-(NSMutableDictionary *)queryWithCurrentMonthTime{
    return [BillModelTool queryWithCurrentMonthTime];
}

-(NSMutableDictionary *)queryWithAllMonthTime{
    return [BillModelTool queryWithAllMonthTime];
}

-(NSMutableDictionary *)queryWithOfMonthTime:(NSString *)time{
    return [BillModelTool queryWithOfMonthTime:time];
}

-(void)deleteTime:(int)ids{
    [BillModelTool deleteTime:ids];
}

-(void)insertTime:(BillModel *)diaryTime{
    [BillModelTool insertTime:diaryTime];
}


-(BillModel *)queryOneTime:(int)ids{
    return [BillModelTool queryOneTime:ids];
}

-(void)updataTime:(BillModel *)updataTime{
    [BillModelTool updataTime:updataTime];
}
@end
