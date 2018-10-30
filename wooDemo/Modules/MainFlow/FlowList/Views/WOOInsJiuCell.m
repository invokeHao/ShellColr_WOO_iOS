//
//  WOOInsJiuCell.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuCell.h"

@interface WOOInsJiuCell ()

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation WOOInsJiuCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.JiuCollectionView];
    self.contentView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)setModel:(WOOJIuDemoModel *)model {
    if (model) {
        self.titleLabel.text = FORMAT(@"%@%@",model.title,model.IDS);
    }
}

- (WOOBaseCollectionView *)JiuCollectionView {
    if (!_JiuCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _JiuCollectionView = [[WOOBaseCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_JiuCollectionView setBackgroundColor:[UIColor clearColor]];
        [_JiuCollectionView setAlwaysBounceVertical:NO];
        [_JiuCollectionView setAlwaysBounceHorizontal:YES];
        [_JiuCollectionView setShowsHorizontalScrollIndicator:NO];
    }
    return _JiuCollectionView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(14)).WH_textColor([UIColor whiteColor]);
    }
    return _titleLabel;
}

@end
