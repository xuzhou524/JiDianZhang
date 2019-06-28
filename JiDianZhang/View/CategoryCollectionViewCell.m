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
        make.bottom.equalTo(self.contentView).offset(-2);
    }];
    
    _iconImageView = [UIImageView new];
    _iconImageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-8);
        make.width.height.equalTo(@28);
    }];
    

}

@end
