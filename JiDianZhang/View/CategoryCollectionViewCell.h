//
//  CategoryCollectionViewCell.h
//  JiDianZhang
//
//  Created by gozap on 2019/6/27.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CategoryCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView * iconImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@end

@interface TextFieldTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView * iconImageView;
@property(nonatomic,strong)UITextField * titleTextField;
@end

@interface TitleAndImageTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * timeIconImageView;
@property(nonatomic,strong)UILabel * timeTitleLabel;

@property(nonatomic,strong)UIImageView * noteIconImageView;
@property(nonatomic,strong)UITextField * noteTitleTextField;
@end


@interface SaveTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton * saveButton;
@end
