//
//  HistoryBillViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/3.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "HistoryBillViewController.h"
#import "BookListCollectionViewCell.h"

@interface HistoryBillViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableDictionary * billModelDic;
@property (nonatomic, strong) NSMutableArray * billDicAllKeyArray;
@property (nonatomic, strong) BillModel * billModel;
@end

@implementation HistoryBillViewController

-(BillModel *)billModel{
    if (_billModel == nil){
        _billModel = [BillModel new];
    }
    return _billModel;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.billModelDic = [self.billModel queryWithAllMonthTime];
    self.billDicAllKeyArray = (NSMutableArray *)[self.billModelDic allKeys];
    
    NSArray * billDicAllKeyArray = [self.billModelDic allKeys];
    self.billDicAllKeyArray = (NSMutableArray *)[billDicAllKeyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if([obj1 integerValue] < [obj2 integerValue]){
            return NSOrderedDescending;
        }
        return NSOrderedAscending;
    }];
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.title = @"历史账单";
    [self createCollectionView];
}

- (void)createCollectionView{
    self.automaticallyAdjustsScrollViewInsets = YES;
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:fl];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [LCColor backgroudColor];
    [self.view addSubview: _collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    //布局
    fl.minimumInteritemSpacing = 0;
    fl.minimumLineSpacing = 0;
    [_collectionView registerClass:[BookListCollectionViewCell class] forCellWithReuseIdentifier:@"BookListCollectionViewCell"];
}

#pragma mark -- dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.billDicAllKeyArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookListCollectionViewCell" forIndexPath:indexPath];
    NSMutableArray * array = [self.billModelDic objectForKey:self.billDicAllKeyArray[indexPath.row]];
    [cell bind:array];
    return cell;
}

//item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((ScreenWidth - 20) / 2.00 , 150);
}

//调节item边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


@end
