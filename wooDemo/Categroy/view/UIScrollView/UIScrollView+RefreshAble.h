//
//  UIScrollView+RefreshAble.h
//  cosmos
//
//  Created by 黑眼圈 on 2018/7/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

typedef NS_ENUM(NSInteger, WOORefreshType) {
    WOORefreshTypeNone = 0,
    WOORefreshTypeHeader = 1,
    WOORefreshTypeFooter = 2,
    WOORefreshTypeAll = 3
};

@interface UIScrollView (RefreshAble)

@property (nonatomic, strong) RACSubject *onRefreshSubject;


/**
 打开刷新行为

 @param refreshType 需要刷新的类型
 */
- (void)openRefreshWithRefreshType:(WOORefreshType)refreshType;

/**
 停止刷新
 
 @param count 当前数据的数量
 */
- (void)stopRefreshWithCurrentDataCount:(NSInteger)count;

- (void)stopRefresh;

- (void)onNoMoreData;

- (void)resetNoMoreData;

/**
 开始下拉重新加载
 */
- (void)beginHeaderRefreshing;


@end


