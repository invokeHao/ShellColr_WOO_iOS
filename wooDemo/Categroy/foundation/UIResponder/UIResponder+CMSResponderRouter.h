//
//  UIResponder+CMSResponderRouter.h
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (CMSResponderRouter)

- (void)cms_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
