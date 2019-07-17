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
#import "BillModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIView * footBgView;
@property(nonatomic,strong)UIView * headView;

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
    
    self.billModelDic = [self.billModel queryWithCurrentMonthTime];
    
    self.billDicAllKeyArray = (NSMutableArray *)[self.billModelDic allKeys];
    
    [self createHeadView];
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

-(void)createHeadView{
    _headView = [UIView new];
    _headView.backgroundColor = [LCColor backgroudColor];
    [self.view addSubview:_headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@110);
    }];
    
    UIImageView * bgImageView = [UIImageView new];
    bgImageView.backgroundColor = [LCColor LCColor_77_92_127];
    [self.headView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).offset(15);
        make.right.equalTo(self.headView).offset(-15);
        make.top.equalTo(self.headView).offset(15);
        make.bottom.equalTo(self.headView).offset(-10);
    }];
    bgImageView.layer.cornerRadius = 5;
    
    UILabel * monthLabel = [UILabel new];
    monthLabel.text = @"06月";
    monthLabel.font = LCFont2(15);
    monthLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(15);
        make.top.equalTo(bgImageView.mas_centerY).offset(10);
    }];
    
    UILabel * yearLabel = [UILabel new];
    yearLabel.text = @"2019";
    yearLabel.font = LCFont2(15);
    yearLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:yearLabel];
    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(15);
        make.bottom.equalTo(monthLabel.mas_top).offset(-5);
    }];
    
    UIView * linView = [UIView new];
    linView.backgroundColor = [LCColor backgroudColor];
    [bgImageView addSubview:linView];
    [linView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(monthLabel.mas_right).offset(30);
        make.top.equalTo(yearLabel.mas_bottom);
        make.bottom.equalTo(monthLabel.mas_bottom);
        make.width.equalTo(@1);
    }];
    
    UILabel * budgetLabel = [UILabel new];
    budgetLabel.text = @"1000000";
    budgetLabel.font = LCFont2(15);
    budgetLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:budgetLabel];
    [budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linView).offset(30);
        make.centerY.equalTo(monthLabel);
    }];
    
    UILabel * budgetTitleLabel = [UILabel new];
    budgetTitleLabel.text = @"收入";
    budgetTitleLabel.font = LCFont2(15);
    budgetTitleLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:budgetTitleLabel];
    [budgetTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(budgetLabel);
        make.bottom.equalTo(budgetLabel.mas_top).offset(-5);
    }];
    
    UILabel * costLabel = [UILabel new];
    costLabel.text = @"100000";
    costLabel.font = LCFont2(15);
    costLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:costLabel];
    [costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(budgetLabel.mas_right).offset(20);
        make.centerY.equalTo(monthLabel);
    }];
    
    UILabel * costTitleLabel = [UILabel new];
    costTitleLabel.text = @"支出";
    costTitleLabel.font = LCFont2(15);
    costTitleLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:costTitleLabel];
    [costTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(costLabel);
        make.bottom.equalTo(costLabel.mas_top).offset(-5);
    }];
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
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom);
    }];

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
