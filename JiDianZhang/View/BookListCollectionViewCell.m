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
}
@end

@implementation BookCollectionViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self sebView];
    }
    return self;
}

-(void)sebView{

    self.contentView.backgroundColor = [LCColor backgroudColor];
    
    _iconImageView = [UIImageView new];
    _iconImageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@28);
    }];

    _titleLabel = [UILabel new];
    _titleLabel.text = @"零食";
    _titleLabel.font = LCFont2(17);
    _titleLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
    }];

    _numberLabel = [UILabel new];
    _numberLabel.text = @"-1000";
    _numberLabel.font = LCFont2(17);
    _numberLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-15);
    }];
}
@end

@implementation BookHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sebView];
        
    }
    return self;
}

-(void)sebView{
    self.backgroundColor = [LCColor backgroudColor];
    
    _timeLabel = [UILabel new];
    _timeLabel.text = @"05月03日";
    _timeLabel.font = LCFont2(14);
    _timeLabel.textColor = [LCColor LCColor_113_120_150];
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(5);
        make.left.equalTo(self).offset(15);
    }];

    _weekLabel = [UILabel new];
    _weekLabel.text = @"星期日";
    _weekLabel.font = LCFont2(14);
    _weekLabel.textColor = [LCColor LCColor_113_120_150];
    [self addSubview:_weekLabel];
    [_weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.left.equalTo(self.timeLabel.mas_right).offset(10);
    }];
    
    _costLabel = [UILabel new];
    _costLabel.text = @"支出: 234,560";
    _costLabel.font = LCFont2(14);
    _costLabel.textColor = [LCColor LCColor_113_120_150];
    [self addSubview:_costLabel];
    [_costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.right.equalTo(self).offset(-15);
    }];
    
    _budgetLabel = [UILabel new];
    _budgetLabel.text = @"收入: 250,000";
    _budgetLabel.font = LCFont2(14);
    _budgetLabel.textColor = [LCColor LCColor_243_90_93];
    [self addSubview:_budgetLabel];
    [_budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.right.equalTo(self.costLabel.mas_left).offset(-10);
    }];
}
@end
