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
        make.bottom.equalTo(self.contentView).offset(-5);
        make.top.equalTo(self.contentView).offset(15);
    }];
    
//    _titleLabel = [UILabel new];
//    _titleLabel.text = @"指南针";
//    _titleLabel.font = LCFont(18);
//    _titleLabel.textColor = [LCColor whiteColor];
//    [self.contentView addSubview:_titleLabel];
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.bgImageView);
//        make.left.equalTo(self.bgImageView.mas_centerX);
//    }];
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
