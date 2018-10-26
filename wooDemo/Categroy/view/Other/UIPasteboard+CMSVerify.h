//
//  UIPasteboard+CMSVerify.h
//  cosmos
//
//  Created by colr on 2018/6/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPasteboard (CMSVerify)

@property (nonatomic, copy, readonly) NSString *inviteCodePasteboardString;


/**
 如是识别到是票圈邀请码,就清空系统粘贴板数据
 */
- (void)cleanGeneralPasteboardString;


/**
 是否是票圈邀请码
 */
- (BOOL)isPlanetInviteCode;

- (BOOL)checkCode:(NSString*)code;

@end

NS_ASSUME_NONNULL_END
