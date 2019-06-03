//
//  BookListCollectionViewCell.h
//  JiDianZhang
//
//  Created by gozap on 2019/6/3.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookListCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView * bgImageView;

//@property(nonatomic,strong)UIImageView * iconImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * costLabel;
@property(nonatomic,strong)UILabel * budgetLabel;
@property(nonatomic,strong)UILabel * numberLabel;
@end
