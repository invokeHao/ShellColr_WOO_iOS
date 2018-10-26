//
//  CMSRefreshNormalHeader.m
//  cosmos
//
//  Created by colr on 2018/6/26.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "CMSRefreshNormalHeader.h"

@implementation CMSRefreshNormalHeader

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        self.stateLabel.hidden = YES;
        self.lastUpdatedTimeLabel.hidden = YES;
    }
    return self;
}

@end
