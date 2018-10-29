//
//  WOOInsJiuCell.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuCell.h"

@interface WOOInsJiuCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

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
    self.JiuCollectionView.delegate = self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (VERTICAL_SCREEN_WIDTH -8)/3;
    if (indexPath.item == 1) {
        return CGSizeMake(2* width, 2*width);
    }else{
        return CGSizeMake(width, width);
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

@end
