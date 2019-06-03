//
//  BookListCollectionViewCell.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/3.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "BookListCollectionViewCell.h"

@implementation BookListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sebView];
        
    }
    return self;
}

-(void)sebView{
    _bgImageView = [UIImageView new];
    _bgImageView.backgroundColor = [LCColor whiteColor];
    _bgImageView.layer.shadowColor= [LCColor LCColor_110_110_110].CGColor;//阴影颜色
    _bgImageView.layer.shadowOffset= CGSizeMake(0,0);//偏移距离
    _bgImageView.layer.shadowOpacity= 0.1;//不透明度
    _bgImageView.layer.shadowRadius= 3.0;//半径
    _bgImageView.layer.cornerRadius = 5;
    [self.contentView addSubview:_bgImageView];
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(5);
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"05月";
    _titleLabel.font = LCFont(18);
    _titleLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView).offset(15);
        make.left.equalTo(self.bgImageView).offset(15);
    }];
    
    _costLabel = [UILabel new];
    _costLabel.text = @"支出 ¥ 234,560";
    _costLabel.font = LCFont2(13);
    _costLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_costLabel];
    [_costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.bgImageView).offset(15);
    }];
    
    _budgetLabel = [UILabel new];
    _budgetLabel.text = @"收入 ¥ 250,000";
    _budgetLabel.font = LCFont2(13);
    _budgetLabel.textColor = [LCColor LCColor_243_90_93];
    [self.contentView addSubview:_budgetLabel];
    [_budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.costLabel.mas_bottom).offset(5);
        make.left.equalTo(self.bgImageView).offset(15);
    }];
    
    _numberLabel = [UILabel new];
    _numberLabel.text = @"共 15 笔";
    _numberLabel.font = LCFont2(12);
    _numberLabel.textColor = [LCColor LCColor_113_120_150];
    [self.contentView addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView).offset(-15);
        make.right.equalTo(self.bgImageView).offset(-15);
    }];
//
//    _iconImageView = [UIImageView new];
//    [self.contentView addSubview:_iconImageView];
//    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.bgImageView);
//        make.right.equalTo(self.titleLabel.mas_left).offset(-15);
//        make.width.height.equalTo(@28);
//    }];
}
@end
