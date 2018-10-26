//
//  UIPasteboard+CMSVerify.m
//  cosmos
//
//  Created by colr on 2018/6/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIPasteboard+CMSVerify.h"

NSString * const CMSPasteboardInviteCode = @"CMSPasteboardInviteCode";

@implementation UIPasteboard (CMSVerify)

- (NSString *)inviteCodePasteboardString {
    UIPasteboard *inviteCodePasteboard = [UIPasteboard pasteboardWithName:CMSPasteboardInviteCode create:YES];
    return inviteCodePasteboard.string;
}

- (void)cleanGeneralPasteboardString {
    UIPasteboard *inviteCodePasteboard = [UIPasteboard pasteboardWithName:CMSPasteboardInviteCode create:YES];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = @"";
    inviteCodePasteboard.string = @"";
}

- (BOOL)isPlanetInviteCode {
    UIPasteboard *inviteCodePasteboard = [UIPasteboard pasteboardWithName:CMSPasteboardInviteCode create:YES];
    UIPasteboard *systemPasteboard = [UIPasteboard generalPasteboard];
    if (systemPasteboard.string && ![systemPasteboard.string isEqualToString:@""]) {
        inviteCodePasteboard.string = systemPasteboard.string;
    }
    
    if ([self checkCode:inviteCodePasteboard.string]) {
        return YES;
    }else {
        return NO;
    }
}

#pragma mark- 正则判断邀请码为5位，前两位为大写英文，后三位为数字
- (BOOL)checkCode:(NSString*)code{
    //    NSString *pattern = @"^[A-Z]+[A-Z]+[0-9]+[0-9]+[0-9]$";
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    //    BOOL isMatch = [pred evaluateWithObject:code];
    BOOL isMatch = code.length >4;
    if (code.length > 8) {
        isMatch = NO;
    }
    if ([self isChinese:code]) {
        isMatch = NO;
    }
    return isMatch;
}

- (BOOL)isChinese:(NSString *)str {
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4E00 && a < 0x9FFF)
        {
            return YES;
        }
    }
    return NO;
}

@end
