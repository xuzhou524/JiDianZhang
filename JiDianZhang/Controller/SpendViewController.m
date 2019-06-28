//
//  SpendViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/27.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "SpendViewController.h"
#import "CategoryCollectionViewCell.h"

@interface SpendViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView * collectionView;
@end

@implementation SpendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    self.view.backgroundColor = [LCColor backgroudColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [LCColor backgroudColor];
    [self.view addSubview: _collectionView];
    
    [_collectionView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
    
}

#pragma mark -- dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 24;
}

//item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(ScreenWidth / 6.00, ScreenWidth  / 6.00);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *cell = (CategoryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

@end
