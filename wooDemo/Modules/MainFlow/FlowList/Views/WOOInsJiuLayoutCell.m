//
//  WOOInsJiuLayoutCell.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuLayoutCell.h"

@interface WOOInsJiuLayoutCell ()

@end

@implementation WOOInsJiuLayoutCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.collectionView];
    self.contentView.backgroundColor = [UIColor yellowColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.collectionView setFrame:self.contentView.bounds];
}

- (WOOBaseCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[WOOBaseCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        [_collectionView setAlwaysBounceVertical:NO];
        [_collectionView setAlwaysBounceHorizontal:YES];
        [_collectionView setShowsHorizontalScrollIndicator:NO];
        [_collectionView setScrollEnabled:NO];
    }
    return _collectionView;
}

@end
