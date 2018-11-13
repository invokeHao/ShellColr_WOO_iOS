//
//  UIScrollView+RefreshAble.m
//  cosmos
//
//  Created by 黑眼圈 on 2018/7/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//
//
//  ---上下拉刷新---

#import "UIScrollView+RefreshAble.h"
#import <objc/runtime.h>

static char *OnRefreshSubjectKey = "OnRefreshSubjectKey";
static char *OnRefreshType = "OnRefreshType";

@interface UIScrollView()

@property (nonatomic, strong, readonly) MJRefreshNormalHeader *headerRefresher;
@property (nonatomic, strong, readonly) MJRefreshBackGifFooter *footerRefresher;
@property (nonatomic, assign) WOORefreshType refreshType;

@end

@implementation UIScrollView (RefreshAble)

- (void)openRefreshWithRefreshType:(WOORefreshType)refreshType {
    self.refreshType = refreshType;
    self.onRefreshSubject = [RACSubject subject];
    switch (refreshType) {
        case WOORefreshTypeAll:
            [self headerRefresher];
            [self footerRefresher];
            break;
        case WOORefreshTypeHeader:
            [self headerRefresher];
            break;
        case WOORefreshTypeFooter:
            [self headerRefresher];
            break;
        case WOORefreshTypeNone:
            break;
        default:
            break;
    }
}

- (void)stopRefreshWithCurrentDataCount:(NSInteger)count {
    [self stopRefresh];
    if (self.headerRefresher.isRefreshing) {
        [self resetNoMoreData];
    }else if (self.footerRefresher.isRefreshing) {
        count == [self fetchOldDataCount] ? [self onNoMoreData] : nil;
    }
}

- (void)stopRefresh {
    switch (self.refreshType) {
        case WOORefreshTypeAll:
            if (self.headerRefresher.isRefreshing) {
                [self.headerRefresher endRefreshing];
            }
            if (self.footerRefresher.isRefreshing) {
                [self.footerRefresher endRefreshing];
            }
            break;
        case WOORefreshTypeHeader:
            if (self.headerRefresher.isRefreshing) {
                [self.headerRefresher endRefreshing];
            }
            break;
        case WOORefreshTypeFooter:
            [self headerRefresher];
            if (self.footerRefresher.isRefreshing) {
                [self.footerRefresher endRefreshing];
            }
            break;
        case WOORefreshTypeNone:
            break;
        default:
            break;
    }
}

- (void)onHeaderRefresh {
    [self.onRefreshSubject sendNext:@(WOORefreshTypeHeader)];
}

- (void)onFooterRefresh {
    [self.onRefreshSubject sendNext:@(WOORefreshTypeFooter)];
}

- (void)beginHeaderRefreshing {
    [self.headerRefresher beginRefreshing];
}

- (void)resetNoMoreData {
    if (self.refreshType == WOORefreshTypeAll || self.refreshType == WOORefreshTypeFooter) {
        [self.footerRefresher resetNoMoreData];
    }
}

- (void)onNoMoreData {
    if (self.refreshType == WOORefreshTypeAll || self.refreshType == WOORefreshTypeFooter) {
        [self.footerRefresher endRefreshingWithNoMoreData];
    }
}

// MARK: - event response

- (void)headerRefreshEvent {
    if (self.refreshType == WOORefreshTypeAll || self.refreshType == WOORefreshTypeFooter) {
        if (self.footerRefresher.isRefreshing) {
            [self.headerRefresher endRefreshing];
            return;
        }
    }
    [self onHeaderRefresh];
}

- (void)footerRefreshEvent {
    if (self.refreshType == WOORefreshTypeAll || self.refreshType == WOORefreshTypeHeader) {
        if (self.headerRefresher.isRefreshing) {
            [self.footerRefresher endRefreshing];
            return;
        }
    }
    [self onFooterRefresh];
}


// MARK: - private method

- (NSInteger)fetchOldDataCount {
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        return [tableView numberOfRowsInSection:0];
    }else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        return [collectionView numberOfItemsInSection:0];
    }else {
        return 0;
    }
}

#pragma mark - getting and setting

- (MJRefreshNormalHeader *)headerRefresher {
    if (self.mj_header != nil) {
        return (MJRefreshNormalHeader *)self.mj_header;
    }
    MJRefreshNormalHeader *refresher = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshEvent)];
    refresher.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    refresher.stateLabel.hidden = YES;
    refresher.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header = refresher;
    return refresher;
}

- (MJRefreshBackGifFooter *)footerRefresher {
    if (self.mj_footer != nil) {
        return (MJRefreshBackGifFooter *)self.mj_footer;
    }
    MJRefreshBackGifFooter *refresher = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshEvent)];
    [refresher setTitle:@"--没有更多内容了--" forState:(MJRefreshStateNoMoreData)];
    self.mj_footer = refresher;
    return refresher;
}

- (RACSubject *)onRefreshSubject {
    return objc_getAssociatedObject(self, &OnRefreshSubjectKey);
}

- (void)setOnRefreshSubject:(RACSubject *)onRefreshSubject {
    objc_setAssociatedObject(self, &OnRefreshSubjectKey, onRefreshSubject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (WOORefreshType)refreshType {
    NSNumber *newDataCountNumber = objc_getAssociatedObject(self, &OnRefreshType);
    return [newDataCountNumber integerValue];
}

- (void)setRefreshType:(WOORefreshType)refreshType {
    objc_setAssociatedObject(self, &OnRefreshType, @(refreshType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
