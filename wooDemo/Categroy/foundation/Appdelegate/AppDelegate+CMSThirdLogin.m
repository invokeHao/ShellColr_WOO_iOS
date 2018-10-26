//
//  AppDelegate+CMSThirdLogin.m
//  cosmos
//
//  Created by colr on 2018/10/11.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import "AppDelegate+CMSThirdLogin.h"
#import <WechatOpenSDK/WXApi.h>
#import <Weibo_SDK/WeiboSDK.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WOOLoginService.h"

@interface AppDelegate(CMSThirdLogin) <WXApiDelegate,WeiboSDKDelegate,QQApiInterfaceDelegate>

@end

@implementation AppDelegate (CMSThirdLogin)

- (void)configTheThirdLogin {
    [WXApi registerApp:CMSWeChatAppKey];
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:CMSWeiboAppkey];
//    [CMSLoginManager sharedManager];
}

#pragma mark - WeiboSDKDelegate

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    NSLog(@"didReceiveWeiboRequest : %@", request);
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class]) {
        if (response.statusCode == 0) {
            [[WOOAlertTool shareInstance] showALterViewWithOneButton:@"新浪微博" andMessage:@"分享成功"];
//            [[CMSShareManager manager] postShareArticleFeedBack];
        }
        else {
            [[WOOAlertTool shareInstance] showALterViewWithOneButton:@"新浪微博" andMessage:@"分享失败"];
        }
    } else if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        WBAuthorizeResponse *authResponse = (WBAuthorizeResponse *)response;
        WOOThirdAuthResponse *thirdResponse = [[WOOThirdAuthResponse alloc] initWithOpenId:authResponse.userID
                                                                                      code:authResponse.accessToken
                                                                                      avti:CMSThirdPartyTypeWeibo];
        
        [WOOLoginService loginWithThirdAuthResponse:thirdResponse completion:^(WOOLoginModel *loginModel, NSError *error) {
            if (error) {
                [WOOHud showString:@"微博认证失败"];
            } else {
                [WOOLoginManager sharedManager].userLoginModel = loginModel;
            }
        }];
    }
    
}

#pragma mark - WXApiDelegate

- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *authResp = (SendAuthResp *)resp;
        if (authResp.errCode == 0) {
            WOOThirdAuthResponse *thirdResponse = [[WOOThirdAuthResponse alloc] initWithOpenId:@""
                                                                                          code:authResp.code
                                                                                          avti:CMSThirdPartyTypeWechat];
            
            [WOOLoginService loginWithThirdAuthResponse:thirdResponse completion:^(WOOLoginModel *loginModel, NSError *error) {
                if (error) {
                    [WOOHud showString:@"微信登录失败"];
                } else {
                    [WOOLoginManager sharedManager].userLoginModel = loginModel;
                }
            }];
        } else {
            [WOOHud showString:@"微信认证失败"];
        }
    }
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"微信分享"];
        SendAuthResp *aresp = (SendAuthResp *)resp;
        NSString *strMsg;
        if (aresp.errCode == 0) {
            strMsg = NSLocalizedString(@"分享成功！", @"");
//            [[CMSShareManager manager] postShareArticleFeedBack];
        }else{
            strMsg = NSLocalizedString(@"分享失败！", @"");
        }
        
        [[WOOAlertTool shareInstance] showALterViewWithOneButton:strTitle andMessage:strMsg];
    }
    //微信和QQ回调的方法名相同所以暂时放在一起了
    if (resp.type == ESENDMESSAGETOQQRESPTYPE) {
        SendMessageToQQResp* sendResp = (SendMessageToQQResp*)resp;
        if ([sendResp.result isEqualToString:@"0"]) {
            [[WOOAlertTool shareInstance] showALterViewWithOneButton:@"QQ分享" andMessage:@"分享成功"];
//            [[CMSShareManager manager] postShareArticleFeedBack];
        }
        else {
            [[WOOAlertTool shareInstance] showALterViewWithOneButton:@"QQ分享" andMessage:@"分享失败"];
        }
    }
}

- (void)isOnlineResponse:(NSDictionary *)response {
}

- (void)onReq:(BaseReq *)req {
}

- (BOOL)cms_thirdPatyHandleTheUrl:(NSURL*)url {
    BOOL result = NO;
    result = [WeiboSDK handleOpenURL:url delegate:self];
    result = [TencentOAuth HandleOpenURL:url];
    result = [QQApiInterface handleOpenURL:url delegate:self];
    result = [WXApi handleOpenURL:url delegate:self];
    return result;
}

@end
