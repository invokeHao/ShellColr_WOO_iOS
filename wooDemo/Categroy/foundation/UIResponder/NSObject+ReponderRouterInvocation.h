//
//  NSObject+ReponderRouterInvocation.h
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ReponderRouterInvocation)
/**
 Create a invocation (Cache invocation)
 
 @param selector method selector
 @return invocation
 */
- (NSInvocation *)cms_createInvocationWithSelector:(SEL)selector;

/**
 Call invocation.(pravite)
 
 @param invocation invocation
 @param userInfo userinfo
 */
- (void)cms_invoke:(NSInvocation *)invocation userInfo:(NSDictionary *)userInfo;

/**
 invocation dict
 
 @return dict
 */
- (NSDictionary *)cms_currentEventStrategy;

/**
 User name to call invocation
 
 @param name name
 @param userInfo user info
 */
- (void)cms_responderRouterWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

@end
