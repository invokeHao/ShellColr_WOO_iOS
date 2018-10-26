//
//  WOORouter.h
//  cosmos
//
//  Created by 周凌宇 on 2018/5/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WOORoute : NSObject

@property (nonatomic, strong) NSDictionary *paramaters;

@property (nonatomic, copy) NSString *module;
@property (nonatomic, copy) NSString *moduleTitle;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *subModule;
@property (nonatomic, copy) NSString *subModuleKey;
@property (nonatomic, copy) NSString *action;

@end

@interface WOORouter : NSObject

+ (void)handleRoute:(WOORoute *)route;
 
+ (BOOL)routeURL:(NSURL *)URL;

@end
