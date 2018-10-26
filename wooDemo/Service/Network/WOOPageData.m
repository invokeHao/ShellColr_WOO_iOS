//
//  CMSPageData.m
//  cosmos
//
//  Created by 周凌宇 on 2018/4/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOOPageData.h"

@implementation WOOPageRange

- (instancetype)init {
    if (self = [super init]) {
        _page = 0;
        _countPerPage = 50;
        _startRowIdx = 0;
        _endRowIdx = 49;
    }
    return self;
}

- (void)setPage:(NSInteger)page {
    _page = page;
    _startRowIdx = _countPerPage * _page;
    _endRowIdx = _startRowIdx + _countPerPage - 1;
}

@end

@implementation WOOPageData

- (instancetype)init {
    if (self = [super init]) {
        _range = [WOOPageRange new];
    }
    return self;
}

@end
