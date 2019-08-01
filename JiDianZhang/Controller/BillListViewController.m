//
//  BillListViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/8/1.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "BillListViewController.h"
#import "BookListCollectionViewCell.h"

@interface BillListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;

@property (nonatomic, strong) NSMutableDictionary * billModelDic;
@property (nonatomic, strong) NSMutableArray * billDicAllKeyArray;
@property (nonatomic, strong) BillModel * billModel;
@end

@implementation BillListViewController

-(BillModel *)billModel{
    if (_billModel == nil){
        _billModel = [BillModel new];
    }
    return _billModel;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.billModelDic = [self.billModel queryWithOfMonthTime:self.time];
    self.billDicAllKeyArray = (NSMutableArray *)[self.billModelDic allKeys];
    
    NSArray * billDicAllKeyArray = [self.billModelDic allKeys];
    
    self.billDicAllKeyArray = (NSMutableArray *)[billDicAllKeyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if([obj1 integerValue] < [obj2 integerValue]){
            return NSOrderedDescending;
        }
        return NSOrderedAscending;
    }];

    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = [DateFormatter stringFromStringYeayMonth:[DateFormatter dateFromTimeStampString:self.time]];
    [self createTableView];
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

