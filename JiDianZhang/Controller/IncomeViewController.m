//
//  IncomeViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/27.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "IncomeViewController.h"
#import "CategoryCollectionViewCell.h"
#import "TPKeyboardAvoidingTableView.h"

@interface IncomeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)TPKeyboardAvoidingTableView * tableView;

@property(nonatomic,strong)TextFieldTableViewCell * amountCell;
@property(nonatomic,strong)TitleAndImageTableViewCell * titleAndImageCell;
@property(nonatomic,strong)ImageModel * selectModel;
@end

@implementation IncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    self.view.backgroundColor = [LCColor backgroudColor];
    
    [self createTableView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backupgroupTap:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer]; //只需要点击非文字输入区域就会响应
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    
}

- (void)backupgroupTap:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

-(void)createTableView{
    _tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [LCColor backgroudColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
    regClass(self.tableView, TextFieldTableViewCell);
    regClass(self.tableView, TitleAndImageTableViewCell);
    regClass(self.tableView, SaveTableViewCell);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, (([SpendManager readLocalIncomeIconFile].count/5) + ([SpendManager readLocalIncomeIconFile].count%5 != 0 ? 1 : 0) ) * ScreenWidth  / 5.00) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [LCColor backgroudColor];
    self.tableView.tableHeaderView = _collectionView;
    
    [_collectionView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
}


#pragma mark -- UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return 100;
    }
    return 65;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TextFieldTableViewCell * cell = getCell(TextFieldTableViewCell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = @"金额";
        self.amountCell = cell;
        return cell;
    }else if (indexPath.row == 1){
        TitleAndImageTableViewCell * cell = getCell(TitleAndImageTableViewCell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.timeTitleLabel.text = @"今天";
        self.titleAndImageCell = cell;
        return cell;
    }else if (indexPath.row == 2){
        SaveTableViewCell * cell = getCell(SaveTableViewCell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.saveButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    return [UITableViewCell new];
}

-(void)saveClick{
    BillModel * billModel = [BillModel new];
    if (self.amountCell.titleTextField.text.length > 0) {
        billModel.amount = self.amountCell.titleTextField.text;
    }else{
        return;
    }
    if (self.selectModel.imageId) {
        billModel.iconTypeId = self.selectModel.imageId;
    }else{
        return;
    }
    billModel.content = self.titleAndImageCell.noteTitleTextField.text;
    billModel.time = [DateFormatter stringMillisecondFromDate:[NSDate new]];
    billModel.category = JD_CATEGORY_INCOME;
    [billModel insertTime:billModel];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [SpendManager readLocalIncomeIconFile].count;
}

//item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(ScreenWidth / 5.00, ScreenWidth  / 5.00);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *cell = (CategoryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    ImageModel * mdeol = [SpendManager readLocalIncomeIconFile][indexPath.row];
    cell.titleLabel.text = mdeol.title;
    cell.iconImageView.image = [UIImage imageNamed:mdeol.imageName];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectModel = [SpendManager readLocalIncomeIconFile][indexPath.row];
}
@end
