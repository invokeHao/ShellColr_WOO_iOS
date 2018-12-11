//
//  WOOBaseTableView.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseTableView.h"

@implementation WOOBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
    return self;
}

- (void)setFooterRefreshingBlock:(MJRefreshComponentRefreshingBlock)footerRefreshingBlock {
    _footerRefreshingBlock = footerRefreshingBlock;
    MJRefreshAutoStateFooter *footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:footerRefreshingBlock];
    footer.stateLabel.textColor = [UIColor woo_colorWithHexString:@"ffffff"];
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
