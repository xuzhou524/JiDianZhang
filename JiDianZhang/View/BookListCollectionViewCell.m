//
//  BookListCollectionViewCell.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/3.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "BookListCollectionViewCell.h"

@implementation BookTotalHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sebView];
        
    }
    return self;
}

-(void)sebView{
    self.backgroundColor = [LCColor backgroudColor];
    
    UIImageView * bgImageView = [UIImageView new];
    bgImageView.backgroundColor = [LCColor LCColor_77_92_127];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-10);
    }];
    bgImageView.layer.cornerRadius = 5;
    
    NSCalendar *gregorian = [[ NSCalendar alloc ] initWithCalendarIdentifier : NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents* newDateComponent = [gregorian components:unitFlags fromDate:[NSDate date]];
    [newDateComponent setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];

    UILabel * monthLabel = [UILabel new];
    monthLabel.text =[NSString stringWithFormat:@"%ld月",(long)newDateComponent.month];
    monthLabel.font = LCFont2(15);
    monthLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgImageView).offset(15);
        make.top.equalTo(bgImageView.mas_centerY).offset(10);
    }];

    UILabel * yearLabel = [UILabel new];
    yearLabel.text = [NSString stringWithFormat:@"%ld",(long)newDateComponent.year];
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

    _budgetLabel = [UILabel new];
    _budgetLabel.font = LCFont2(15);
    _budgetLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:_budgetLabel];
    [_budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linView).offset(30);
        make.centerY.equalTo(monthLabel);
    }];

    UILabel * budgetTitleLabel = [UILabel new];
    budgetTitleLabel.text = @"收入";
    budgetTitleLabel.font = LCFont2(15);
    budgetTitleLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:budgetTitleLabel];
    [budgetTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.budgetLabel);
        make.bottom.equalTo(self.budgetLabel.mas_top).offset(-5);
    }];

    _costLabel = [UILabel new];
    _costLabel.font = LCFont2(15);
    _costLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:_costLabel];
    [_costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.budgetLabel.mas_right).offset(20);
        make.centerY.equalTo(monthLabel);
    }];

    UILabel * costTitleLabel = [UILabel new];
    costTitleLabel.text = @"支出";
    costTitleLabel.font = LCFont2(15);
    costTitleLabel.textColor = [LCColor backgroudColor];
    [bgImageView addSubview:costTitleLabel];
    [costTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.costLabel);
        make.bottom.equalTo(self.costLabel.mas_top).offset(-5);
    }];
}

@end

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
-(void)bind:(NSMutableArray *)modelArray{
    BillModel * model = modelArray.firstObject;
    self.titleLabel.text = [DateFormatter stringFromStringYeayMonth:[DateFormatter dateFromTimeStampString:model.time]];
    self.numberLabel.text = [NSString stringWithFormat:@"共 %lu 笔",(unsigned long)modelArray.count];
    
    NSInteger spendMoney = 0;
    NSInteger incomeMoney = 0;
    for (BillModel * model in modelArray) {
        if ([model.category isEqualToString:JD_CATEGORY_SPEND]) {
            spendMoney += [model.amount integerValue];
        }else{
            incomeMoney += [model.amount integerValue];
        }
    }
    self.costLabel.text = [NSString stringWithFormat:@"支出 ¥ %ld",(long)spendMoney];
    self.budgetLabel.text = [NSString stringWithFormat:@"收入 ¥ %ld",(long)incomeMoney];
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
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@38);
    }];

    _titleLabel = [UILabel new];
    _titleLabel.text = @"零食";
    _titleLabel.font = LCFont2(17);
    _titleLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
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

-(void)bind:(BillModel *)model{
    self.numberLabel.text = model.amount;
    if ([model.category isEqualToString:JD_CATEGORY_SPEND]) {
        ImageModel * imageModel = [SpendManager readLocalSpendIconFileWithImageId:model.iconTypeId];
        self.iconImageView.image = [UIImage imageNamed:imageModel.imageName];
        self.titleLabel.text = imageModel.title;
        self.numberLabel.text = model.amount;
        self.numberLabel.textColor = [LCColor LCColor_113_120_150];
    }else{
        ImageModel * imageModel = [SpendManager readLocalIncomeIconFileWithImageId:model.iconTypeId];
        self.iconImageView.image = [UIImage imageNamed:imageModel.imageName];
        self.titleLabel.text = imageModel.title;
        self.numberLabel.text = model.amount;
        self.numberLabel.textColor = [LCColor LCColor_243_90_93];
    }
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
        make.centerY.equalTo(self).offset(0);
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

-(void)bind:(NSMutableArray *)modelArray{
    BillModel * model = modelArray.firstObject;
    self.timeLabel.text = [DateFormatter stringFromStringMonthDay:[DateFormatter dateFromTimeStampString:model.time]];
    self.weekLabel.text = [DateFormatter weekdayStringWithDate:[DateFormatter dateFromTimeStampString:model.time]];
    
    NSInteger spendMoney = 0;
    NSInteger incomeMoney = 0;
    for (int i = 0; i < modelArray.count; i ++) {
        BillModel * model = modelArray[i];
        if ([model.category isEqualToString:JD_CATEGORY_SPEND]) {
            spendMoney += [model.amount integerValue];
        }else{
            incomeMoney += [model.amount integerValue];
        }
    }
    self.costLabel.text = [NSString stringWithFormat:@"支出: %ld",(long)spendMoney];
    self.budgetLabel.text = [NSString stringWithFormat:@"收入: %ld",(long)incomeMoney];
}
@end
