//
//  NSObject+ReponderRouterInvocation.m
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSObject+ReponderRouterInvocation.h"
#import "UIResponder+CMSResponderRouter.h"

@implementation NSObject (ReponderRouterInvocation)

- (NSInvocation *)cms_createInvocationWithSelector:(SEL)selector {
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        return nil;
    }
    NSInvocation*invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    return invocation;
}

- (void)cms_invoke:(NSInvocation *)invocation userInfo:(NSDictionary *)userInfo{
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}

- (void)cms_responderRouterWithName:(NSString *)name userInfo:(NSDictionary *)userInfo {
    NSInvocation *invication = [[self cms_currentEventStrategy] objectForKey:name];
    [self cms_invoke:invication userInfo:userInfo];
    
}

- (NSDictionary *)cms_currentEventStrategy {
    return nil;
}
@end
