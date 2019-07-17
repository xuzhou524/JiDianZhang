//
//  SpendManager.h
//  JiDianZhang
//
//  Created by gozap on 2019/7/17.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageModel : NSObject

@property (nonatomic, strong) NSString * imageId;

@property (nonatomic, strong) NSString * title;

@property (nonatomic, strong) NSString * imageName;

@property (nonatomic, strong) NSString * imageName_sel;

-(instancetype)initWithDic:(NSMutableDictionary *)dicData;
@end


@interface SpendManager : NSObject

// 获取本地 收入icon
+ (NSMutableArray *)readLocalSpendIconFile;

// 根据Id获取本地 收入icon数据
+ (ImageModel *)readLocalSpendIconFileWithImageId:(NSString *)imageId;



// 获取本地 支出icon
+ (NSMutableArray *)readLocalIncomeIconFile;

// 根据Id获取本地 支出icon数据
+ (ImageModel *)readLocalIncomeIconFileWithImageId:(NSString *)imageId;

@end
