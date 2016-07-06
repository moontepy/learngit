//
//  CustomUICollectionViewCell.m
//  test
//
//  Created by 金峰 on 16/7/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CustomUICollectionViewCell.h"
@interface CustomUICollectionViewCell ()

@property (strong,nonatomic) UIImageView * imageView ;

@property (strong,nonatomic) UILabel * titleLabel ;

@end
@implementation CustomUICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat imageVW = frame.size.height - 40 ;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, imageVW, imageVW)] ;
        [self.contentView addSubview:self.imageView] ;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), frame.size.width, 30)] ;
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:22] ;
        [self.contentView addSubview:self.titleLabel] ;
    }
    return self ;
}

- (void)setModel:(MyModel *)model
{
    _model = model ;
    
    self.imageView.image = [UIImage imageNamed:model.userImage] ;
    
    self.titleLabel.text = model.userName ;
}


@end
