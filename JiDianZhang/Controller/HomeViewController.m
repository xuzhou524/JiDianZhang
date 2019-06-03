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

@interface HomeViewController ()
@property(nonatomic,strong)UIView * footBgView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UILabel * liftLabel = [UILabel new];
    liftLabel.text = @"记点账本";
    liftLabel.font = LCFont(23);
    liftLabel.textColor = [LCColor LCColor_77_92_127];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:liftLabel];
    
    UIButton * rightBtn = [UIButton new];
    UIImage * addIamge = [[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    rightBtn.tintColor = [LCColor LCColor_77_92_127];
    [rightBtn setImage:addIamge forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    [self createFootView];

}

-(void)rightBtnClick{
    HistoryBillViewController * historyBillVC = [HistoryBillViewController new];
    [self.navigationController pushViewController:historyBillVC animated:YES];
}

-(void)createFootView{
    _footBgView = [UIView new];
    _footBgView.backgroundColor = [LCColor backgroudColor];
    [self.view addSubview:_footBgView];
    [_footBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@90);
    }];
    
    UIView * addView = [UIView new];
    addView.backgroundColor = [LCColor whiteColor];
    [_footBgView addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footBgView).offset(15);
        make.left.equalTo(self.footBgView).offset(20);
        make.right.equalTo(self.footBgView).offset(-20);
        make.height.equalTo(@45);
    }];
    addView.layer.shadowColor= [LCColor LCColor_110_110_110].CGColor;//阴影颜色
    addView.layer.shadowOffset= CGSizeMake(0,0);//偏移距离
    addView.layer.shadowOpacity= 0.1;//不透明度
    addView.layer.shadowRadius= 3.0;//半径
    addView.layer.cornerRadius = 5;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"+ 小记一笔";
    titleLabel.font = LCFont(18);
    titleLabel.textColor = [LCColor LCColor_77_92_127];
    [addView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(addView);
    }];
}

@end
