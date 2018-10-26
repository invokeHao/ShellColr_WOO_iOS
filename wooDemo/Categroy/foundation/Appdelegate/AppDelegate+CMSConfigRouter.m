//
//  AppDelegate+CMSConfigRouter.m
//  cosmos
//
//  Created by colr on 2018/7/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "AppDelegate+CMSConfigRouter.h"

@implementation AppDelegate (CMSConfigRouter)

- (void)setupRouter {
    JLRoutes *routes = [JLRoutes globalRoutes];
    [routes addRoute:@"/:module/:key/:subModule/:subModuleKey/:action" handler:^BOOL(NSDictionary *parameters) {
        NSString *module = parameters[@"module"];
        NSString *key = parameters[@"key"];
        NSString *subModule = parameters[@"subModule"];
        NSString *subModuleKey = parameters[@"subModuleKey"];
        NSString *action = parameters[@"action"];
        WOORoute *route = [WOORoute new];
        route.module = module;
        route.key = key;
        route.subModule = subModule;
        route.subModuleKey = subModuleKey;
        route.action = action;
        route.paramaters = parameters;
//        [WOORoute handleRoute:route];
        return YES;
    }];
    [routes addRoute:@"/:module/:key" handler:^BOOL(NSDictionary *parameters) {
        NSString *module = parameters[@"module"];
        NSString *key = parameters[@"key"];
        WOORoute *route = [WOORoute new];
        route.module = module;
        route.key = key;
        route.paramaters = parameters;
//        [WOORoute handleRoute:route];
        return YES;
    }];
    [routes addRoute:@"/:module/:key/:subModule/:action" handler:^BOOL(NSDictionary *parameters) {
        NSString *module = parameters[@"module"];
        NSString *key = parameters[@"key"];
        NSString *subModule = parameters[@"subModule"];
        NSString *action = parameters[@"action"];
        WOORoute *route = [WOORoute new];
        route.module = module;
        route.key = key;
        route.subModule = subModule;
        route.action = action;
        route.paramaters = parameters;
//        [WOORoute handleRoute:route];
        return YES;
    }];
    
    [routes addRoute:@"/:module/:subModule/:key" handler:^BOOL(NSDictionary *parameters) {
        NSString *module = parameters[@"module"];
        NSString *key = parameters[@"key"];
        NSString *subModule = parameters[@"subModule"];
        WOORoute *route = [WOORoute new];
        route.module = module;
        route.key = key;
        route.subModule = subModule;
        route.paramaters = parameters;
//        [WOORouter handleRoute:route];
        return YES;
    }];
}

@end
