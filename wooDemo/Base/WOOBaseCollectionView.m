//
//  WOOBaseCollectionView.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseCollectionView.h"

@implementation WOOBaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
    }
    return self;
}

- (void)setFooterRefreshingBlock:(MJRefreshComponentRefreshingBlock)footerRefreshingBlock {
    _footerRefreshingBlock = footerRefreshingBlock;
    MJRefreshAutoStateFooter *footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:footerRefreshingBlock];
    //根据业务需求，全部去掉
    footer.stateLabel.hidden = YES;
    self.mj_footer = footer;
}

- (void)setFooterRefreshingWithoutTitleBlock:(MJRefreshComponentRefreshingBlock)FooterRefreshingWithoutTitleBlock{
    _FooterRefreshingWithoutTitleBlock = FooterRefreshingWithoutTitleBlock;
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:FooterRefreshingWithoutTitleBlock];
    footer.stateLabel.hidden = YES;
    self.mj_footer = footer;
}


- (void)setHeaderRefreshingBlock:(MJRefreshComponentRefreshingBlock)headerRefreshingBlock {
    _headerRefreshingBlock = headerRefreshingBlock;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:headerRefreshingBlock];
    header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header= header;
}

@end
