//
//  AppDelegate+CMSThirdLogin.h
//  cosmos
//
//  Created by colr on 2018/10/11.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (CMSThirdLogin)

- (void)configTheThirdLogin;

- (BOOL)cms_thirdPatyHandleTheUrl:(NSURL*)url;

@end

NS_ASSUME_NONNULL_END
