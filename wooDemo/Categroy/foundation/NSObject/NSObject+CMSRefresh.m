//
//  NSObject+CMSRefresh.m
//  cosmos
//
//  Created by colr on 2018/7/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSObject+CMSRefresh.h"
#import <objc/runtime.h>

static char *ShowEmptyViewKey = "showEmptyView";

@implementation NSObject (CMSRefresh)


/*
 objc_AssociationPolicy参数使用的策略：
 OBJC_ASSOCIATION_ASSIGN;            //assign策略
 OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
 OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
 
 OBJC_ASSOCIATION_RETAIN;
 OBJC_ASSOCIATION_COPY;
 */

- (void)setShowEmptyView:(BOOL)showEmptyView {
    objc_setAssociatedObject(self, &ShowEmptyViewKey, @(showEmptyView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)showEmptyView {
    NSNumber *showEmptyNumber = objc_getAssociatedObject(self, &ShowEmptyViewKey);
    return [showEmptyNumber boolValue];
}


@end
