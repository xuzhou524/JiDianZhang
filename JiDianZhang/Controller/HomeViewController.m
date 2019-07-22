//
//  HomeViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/5/31.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "HomeViewController.h"
#import "HistoryBillViewController.h"
#import "BookListCollectionViewCell.h"
#import "AddBookViewController.h"
#import "UserViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIView * footBgView;
@property(nonatomic,strong)BookTotalHeadView * headView;

@property (nonatomic, strong) NSMutableDictionary * billModelDic;
@property (nonatomic, strong) NSMutableArray * billDicAllKeyArray;
@property (nonatomic, strong) BillModel * billModel;
@end

@implementation HomeViewController

-(BillModel *)billModel{
    if (_billModel == nil){
        _billModel = [BillModel new];
    }
    return _billModel;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.billModelDic = [self.billModel queryWithCurrentMonthTime];
    self.billDicAllKeyArray = (NSMutableArray *)[self.billModelDic allKeys];
    [self calculateTheAmountoOfMonthly];
    [self.tableView reloadData];
}

-(void)calculateTheAmountoOfMonthly{
    NSInteger spendMoney = 0;
    NSInteger incomeMoney = 0;
    for (int i = 0; i < self.billModelDic.count; i++) {
        NSString * key = self.billDicAllKeyArray[i];
        NSMutableArray * array = [self.billModelDic objectForKey:key];
        for (BillModel * model in array) {
            if ([model.category isEqualToString:JD_CATEGORY_SPEND]) {
                spendMoney += [model.amount integerValue];
            }else{
                incomeMoney += [model.amount integerValue];
            }
        }
    }
    _headView.budgetLabel.text = [NSString stringWithFormat:@"%ld",spendMoney];
    _headView.costLabel.text = [NSString stringWithFormat:@"%ld",incomeMoney];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UILabel * liftLabel = [UILabel new];
    liftLabel.text = @"记点账本";
    liftLabel.font = LCFont(25);
    liftLabel.textColor = [LCColor LCColor_77_92_127];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:liftLabel];
    
    UIButton * rightBtn = [UIButton new];
    UIImage * addIamge = [[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    rightBtn.tintColor = [LCColor LCColor_77_92_127];
    [rightBtn setImage:addIamge forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * tubiaoBtn = [UIButton new];
    UIImage * tubiaoIamge = [[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tubiaoBtn.tintColor = [LCColor LCColor_77_92_127];
    [tubiaoBtn setImage:tubiaoIamge forState:UIControlStateNormal];
    [tubiaoBtn addTarget:self action:@selector(tubiaoClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:rightBtn],[[UIBarButtonItem alloc] initWithCustomView:tubiaoBtn]];
    [self createTableView];
    [self createFootView];
}

-(void)rightBtnClick{
    UserViewController * userVC = [UserViewController new];
    [self.navigationController pushViewController:userVC animated:YES];
}

-(void)tubiaoClick{
    HistoryBillViewController * historyBillVC = [HistoryBillViewController new];
    [self.navigationController pushViewController:historyBillVC animated:YES];
}

-(BookTotalHeadView *)headView{
    if (_headView == nil) {
        _headView = [[BookTotalHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 110)];
    }
    return _headView;
}

-(void)createFootView{
    _footBgView = [UIView new];
    _footBgView.backgroundColor = [LCColor clearColor];
    [self.view addSubview:_footBgView];
    [_footBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@90);
    }];
    
    UIView * addView = [UIView new];
    addView.backgroundColor = [LCColor LCColor_77_92_127];
    [_footBgView addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footBgView).offset(15);
        make.left.equalTo(self.footBgView).offset(15);
        make.right.equalTo(self.footBgView).offset(-15);
        make.height.equalTo(@48);
    }];
    addView.layer.shadowColor= [LCColor LCColor_110_110_110].CGColor;//阴影颜色
    addView.layer.shadowOffset= CGSizeMake(0,0);//偏移距离
    addView.layer.shadowOpacity= 0.1;//不透明度
    addView.layer.shadowRadius= 3.0;//半径
    addView.layer.cornerRadius = 5;
    [addView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAddBooksView)]];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"小记一笔";
    titleLabel.font = LCFont2(17);
    titleLabel.textColor = [LCColor backgroudColor];
    [addView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(addView).offset(10);
        make.centerY.equalTo(addView);
    }];
    
    UIImageView * addImageView = [UIImageView new];
    addImageView.image = [[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    addImageView.tintColor = [LCColor backgroudColor];
    [addView addSubview:addImageView];
    [addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addView);
        make.right.equalTo(titleLabel.mas_left).offset(-5);
        make.width.height.equalTo(@25);
    }];
}

-(void)didTapAddBooksView{
    AddBookViewController * addBookVC = [AddBookViewController new];
    [self.navigationController pushViewController:addBookVC animated:YES];
}

-(void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [LCColor backgroudColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
    self.tableView.tableHeaderView = self.headView;

    regClass(self.tableView, BookCollectionViewCell);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.billDicAllKeyArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString * key = self.billDicAllKeyArray[section];
    NSMutableArray * array = [self.billModelDic objectForKey:key];
    return array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    BookHeadView * bookHeadView = [BookHeadView new];
    NSMutableArray * array = [self.billModelDic objectForKey:self.billDicAllKeyArray[section]];
    [bookHeadView bind:array];
    return bookHeadView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookCollectionViewCell * cell = getCell(BookCollectionViewCell);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableArray * array = [self.billModelDic objectForKey:self.billDicAllKeyArray[indexPath.section]];
    [cell bind:array[indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 30;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
@end
