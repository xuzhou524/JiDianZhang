//
//  AppListViewController.m
//  LifeCollection
//
//  Created by gozap on 2018/12/21.
//  Copyright © 2018 com.longdai. All rights reserved.
//

#import "AppListViewController.h"
#import "UserViewTableViewCell.h"
#import "LCWebViewViewController.h"
#import "AboutDeveloperViewController.h"

@interface AppListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"app集锦";
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [LCColor backgroudColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    regClass(self.tableView, UserViewTableViewCell);
    regClass(self.tableView, TitleTableViewCell);
    regClass(self.tableView, UserHeadViewTableViewCell);
    regClass(self.tableView, TitleNoRightImageTableViewCell);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 45;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [LCColor backgroudColor];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = LCFont(15);
    titleLabel.text = @"推荐";
    titleLabel.textColor = [LCColor LCColor_113_120_150];
    [bgView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(16);
        make.centerY.equalTo(bgView).offset(5);
    }];
    
    return bgView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        TitleTableViewCell * cell = getCell(TitleTableViewCell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = @[@"用易房贷",@"随时笔记",@"OnePai",@"蓝牙通",@"用易天气"][indexPath.row];
        return cell;
    }else{
        TitleTableViewCell * cell = getCell(TitleTableViewCell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = @[@"V2EX",@"龙贷",@"抽屉新热榜",@"秘峰"][indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str;
    if (indexPath.section == 0) {
        str = @[@"https://itunes.apple.com/cn/app/id1272033544",
                @"https://itunes.apple.com/cn/app/id1330908170",
                @"https://itunes.apple.com/cn/app/id1239242152",
                @"https://itunes.apple.com/cn/app/id1116575370",
                @"https://itunes.apple.com/cn/app/id1107521185"][indexPath.row];
    }else{
        str = @[@"https://itunes.apple.com/cn/app/id1078157349",
                @"https://itunes.apple.com/cn/app/id900365369",
                @"https://itunes.apple.com/cn/app/id513228984",
                @"https://itunes.apple.com/cn/app/id1330536377"][indexPath.row];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
