//
//  CategoryCollectionViewCell.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/27.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sebView];
    }
    return self;
}

-(void)sebView{
    self.backgroundColor = [LCColor backgroudColor];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"零食";
    _titleLabel.font = LCFont2(13);
    _titleLabel.textColor = [LCColor LCColor_77_92_127];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
    
    _iconImageView = [UIImageView new];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.titleLabel.mas_top);
        make.width.height.equalTo(@44);
    }];
}

- (void)setSelected:(BOOL)selected{
    if (selected) {
       _iconImageView.backgroundColor = [UIColor redColor];
    }else{
       _iconImageView.backgroundColor = [LCColor backgroudColor];
    }
}
@end


@implementation TextFieldTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self sebViews];
    }
    return self;
}

-(void)sebViews{
    self.contentView.backgroundColor = [LCColor backgroudColor];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [LCColor whiteColor];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    _iconImageView = [UIImageView new];
    _iconImageView.image = [UIImage imageNamed:@"edit_title"];
    [bgView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.centerY.equalTo(bgView);
        make.width.height.equalTo(@20);
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"金额";
    _titleLabel.font = LCFont(15);
    _titleLabel.textColor = [LCColor LCColor_77_92_127];
    [bgView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.centerY.equalTo(bgView);
    }];
    
    UIImageView *iconImageView = [UIImageView new];
    UIImage * iconIamge = [[UIImage imageNamed:@"circleright"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    iconImageView.tintColor = [LCColor LCColor_113_120_150];
    iconImageView.image=iconIamge;
    [self.contentView addSubview:iconImageView];
    [iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(bgView);
        make.height.equalTo(@12);
        make.width.equalTo(@8);
    }];
    
    _titleTextField = [UITextField new];
    _titleTextField.placeholder = @"请输入金额";
    _titleTextField.textColor = [LCColor LCColor_113_120_150];
    _titleTextField.font = LCFont(15);
    _titleTextField.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_titleTextField];
    [_titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(iconImageView.mas_left).offset(-10);
        make.left.equalTo(self.contentView.mas_centerX).offset(-20);
    }];
    
}

@end

@implementation TitleAndImageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self sebViews];
    }
    return self;
}

-(void)sebViews{
    self.contentView.backgroundColor = [LCColor backgroudColor];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [LCColor whiteColor];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    _timeIconImageView = [UIImageView new];
    _timeIconImageView.image = [UIImage imageNamed:@"shijian"];
    [bgView addSubview:_timeIconImageView];
    [_timeIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.centerY.equalTo(bgView);
        make.width.height.equalTo(@20);
    }];
    
    _timeTitleLabel = [UILabel new];
    _timeTitleLabel.font = LCFont(15);
    _timeTitleLabel.textColor = [LCColor LCColor_77_92_127];
    [bgView addSubview:_timeTitleLabel];
    [_timeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeIconImageView.mas_right).offset(10);
        make.centerY.equalTo(bgView);
    }];
    
    UIView * linView = [UIView new];
    linView.backgroundColor = [LCColor LCColor_113_120_150];
    [bgView addSubview:linView];
    [linView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_centerX).offset(-50);
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.width.equalTo(@1);
    }];
    
    _noteIconImageView = [UIImageView new];
    _noteIconImageView.image = [UIImage imageNamed:@"edit_title"];
    [bgView addSubview:_noteIconImageView];
    [_noteIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linView).offset(16);
        make.centerY.equalTo(bgView);
        make.width.height.equalTo(@20);
    }];
    
    _noteTitleTextField = [UITextField new];
    _noteTitleTextField.placeholder = @"备注";
    _noteTitleTextField.textColor = [LCColor LCColor_113_120_150];
    _noteTitleTextField.font = LCFont(15);
    _noteTitleTextField.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_noteTitleTextField];
    [_noteTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.contentView).offset(-15);
        make.left.equalTo(self.noteIconImageView.mas_right).offset(10);
    }];
    
}
@end

