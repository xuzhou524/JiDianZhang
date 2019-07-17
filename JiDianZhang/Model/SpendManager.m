//
//  SpendManager.m
//  JiDianZhang
//
//  Created by gozap on 2019/7/17.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "SpendManager.h"

@implementation ImageModel
-(instancetype)initWithDic:(NSMutableDictionary *)dicData{
    self = [super init];
    if (self) {
        self.imageId = dicData[@"imageId"];
        self.title = dicData[@"title"];
        self.imageName = dicData[@"imageName"];
        self.imageName_sel = dicData[@"imageName_sel"];
    }
    return self;
}
@end


@implementation SpendManager

// 读取本地JSON文件
+ (NSMutableDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

+ (NSMutableArray *)readLocalSpendIconFile{
    NSMutableDictionary * spendDic = [self readLocalFileWithName:@"SpendData"];
    NSMutableArray * spendDataArray = spendDic[@"data"];
    NSMutableArray * array = [NSMutableArray new];
    for (int i = 0; i < spendDataArray.count; i++) {
        ImageModel * imageModel = [[ImageModel alloc] initWithDic:spendDataArray[i]];
        [array addObject:imageModel];
    }
    return array;
}

+ (ImageModel *)readLocalSpendIconFileWithImageId:(NSString *)imageId{
    NSMutableArray * array = [self readLocalSpendIconFile];
    for (int i = 0; i < array.count; i++) {
        ImageModel * imageModel = array[i];
        if ([imageModel.imageId isEqualToString:imageId]) {
            return imageModel;
        }
    }
    return nil;
}







+ (NSMutableArray *)readLocalIncomeIconFile{
    NSMutableDictionary * incomeDic = [self readLocalFileWithName:@"IncomeData"];
    NSMutableArray * incomeDataArray = incomeDic[@"data"];
    NSMutableArray * array = [NSMutableArray new];
    for (int i = 0; i < incomeDataArray.count; i++) {
        ImageModel * imageModel = [[ImageModel alloc] initWithDic:incomeDataArray[i]];
        [array addObject:imageModel];
    }
    return array;
}

+ (ImageModel *)readLocalIncomeIconFileWithImageId:(NSString *)imageId{
    NSMutableArray * array = [self readLocalIncomeIconFile];
    for (int i = 0; i < array.count; i++) {
        ImageModel * imageModel = array[i];
        if ([imageModel.imageId isEqualToString:imageId]) {
            return imageModel;
        }
    }
    return nil;
}
@end
