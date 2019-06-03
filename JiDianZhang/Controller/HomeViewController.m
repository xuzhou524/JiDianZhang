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

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIView * footBgView;
@property(nonatomic,strong)UIView * headView;
@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createHeadView];
    [self createTableView];
    [self createFootView];
}

-(void)rightBtnClick{

}

-(void)createHeadView{
    _headView = [UIView new];
    _headView.backgroundColor = [LCColor LCColor_77_92_127];
    [self.view addSubview:_headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@140);
    }];
    
    UILabel * liftLabel = [UILabel new];
    liftLabel.text = @"记点账本";
    liftLabel.font = LCFont(20);
    liftLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:liftLabel];
    [liftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).offset(15);
        make.top.equalTo(self.headView).offset(44);
    }];
    
    UIButton * rightBtn = [UIButton new];
    UIImage * addIamge = [[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    rightBtn.tintColor = [LCColor backgroudColor];
    [rightBtn setImage:addIamge forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headView).offset(-15);
        make.centerY.equalTo(liftLabel);
        make.width.height.equalTo(@28);
    }];
    
    UIButton * tubiaoBtn = [UIButton new];
    UIImage * tubiaoIamge = [[UIImage imageNamed:@"tubiao"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tubiaoBtn.tintColor = [LCColor backgroudColor];
    [tubiaoBtn setImage:tubiaoIamge forState:UIControlStateNormal];
    [tubiaoBtn addTarget:self action:@selector(tubiaoClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:tubiaoBtn];
    [tubiaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightBtn.mas_left).offset(-15);
        make.centerY.equalTo(liftLabel);
        make.width.height.equalTo(@28);
    }];
    
    UILabel * monthLabel = [UILabel new];
    monthLabel.text = @"06月";
    monthLabel.font = LCFont2(15);
    monthLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).offset(15);
        make.bottom.equalTo(self.headView).offset(-10);
    }];
    
    UILabel * yearLabel = [UILabel new];
    yearLabel.text = @"2019";
    yearLabel.font = LCFont2(15);
    yearLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:yearLabel];
    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).offset(15);
        make.bottom.equalTo(monthLabel.mas_top).offset(-5);
    }];
    
    UIView * linView = [UIView new];
    linView.backgroundColor = [LCColor backgroudColor];
    [self.headView addSubview:linView];
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
    [self.headView addSubview:budgetLabel];
    [budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linView).offset(30);
        make.centerY.equalTo(monthLabel);
    }];
    
    UILabel * budgetTitleLabel = [UILabel new];
    budgetTitleLabel.text = @"收入";
    budgetTitleLabel.font = LCFont2(15);
    budgetTitleLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:budgetTitleLabel];
    [budgetTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(budgetLabel);
        make.bottom.equalTo(budgetLabel.mas_top).offset(-5);
    }];
    
    UILabel * costLabel = [UILabel new];
    costLabel.text = @"100000";
    costLabel.font = LCFont2(15);
    costLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:costLabel];
    [costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(budgetLabel.mas_right).offset(20);
        make.centerY.equalTo(monthLabel);
    }];
    
    UILabel * costTitleLabel = [UILabel new];
    costTitleLabel.text = @"支出";
    costTitleLabel.font = LCFont2(15);
    costTitleLabel.textColor = [LCColor backgroudColor];
    [self.headView addSubview:costTitleLabel];
    [costTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(costLabel);
        make.bottom.equalTo(costLabel.mas_top).offset(-5);
    }];

}

-(void)tubiaoClick{
    HistoryBillViewController * historyBillVC = [HistoryBillViewController new];
    [self.navigationController pushViewController:historyBillVC animated:YES];
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
        make.left.equalTo(self.footBgView).offset(20);
        make.right.equalTo(self.footBgView).offset(-20);
        make.height.equalTo(@50);
    }];
    addView.layer.shadowColor= [LCColor LCColor_110_110_110].CGColor;//阴影颜色
    addView.layer.shadowOffset= CGSizeMake(0,0);//偏移距离
    addView.layer.shadowOpacity= 0.1;//不透明度
    addView.layer.shadowRadius= 3.0;//半径
    addView.layer.cornerRadius = 5;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"小记一笔";
    titleLabel.font = LCFont2(18);
    titleLabel.textColor = [LCColor whiteColor];
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

-(void)createTableView{
    _tableView = [UITableView new];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [LCColor backgroudColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom);
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    regClass(self.tableView, BookCollectionViewCell);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    BookHeadView * bookHeadView = [BookHeadView new];
    return bookHeadView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookCollectionViewCell * cell = getCell(BookCollectionViewCell);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
