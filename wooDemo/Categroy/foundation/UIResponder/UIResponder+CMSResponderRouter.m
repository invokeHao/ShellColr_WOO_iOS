//
//  UIResponder+CMSResponderRouter.m
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIResponder+CMSResponderRouter.h"
#import <objc/runtime.h>

@implementation UIResponder (CMSResponderRouter)

- (void)cms_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.nextResponder cms_routerEventWithName:eventName userInfo:userInfo];
}
@end
