//
//  BillModel.h
//  JiDianZhang
//
//  Created by gozap on 2019/7/5.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillModel : NSObject

@property (nonatomic, assign) int ids;

@property (nonatomic, copy) NSString * amount;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * time;

@property (nonatomic, copy) NSString * category;

@property (nonatomic, copy) NSString * iconTypeId;


-(NSMutableArray *)queryWithTime;

-(void)deleteTime:(int)ids;

-(void)insertTime:(BillModel *)diaryTime;

-(BillModel *)queryOneTime:(int)ids;

-(void)updataTime:(BillModel *)updataTime;

@end
