//
//  CMSRouter.m
//  cosmos
//
//  Created by 周凌宇 on 2018/5/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOORouter.h"
#import "JLRoutes.h"
//#import "CMSPlanetMessageViewController.h"
//#import "CMSGalaxyMessageViewController.h"
//#import "CMSMyMessageViewController.h"
//#import "CMSNewSimpleCoreflowVC.h"
//#import "CMSTopicDetailVC.h"
//#import "CMSAccountViewController.h"
//#import "CMSMainViewController.h"
//#import "CMSArticleService.h"
//#import "CMSGalaxyInfoViewController.h"

//#import "CMSCircleService.h"
//#import "CMSShareView.h"
//#import "CMSCommentListView.h"
//#import "CMSForwardPlanetListView.h"
//#import "CMSLoginViewController.h"

static NSString *kModuleCicrle = @"circle";
static NSString *kModuleCollection = @"collection";
static NSString *kModuleArticle = @"article";
static NSString *kModuleMyMessage = @"message"; //我的消息
static NSString *KModuleChatRoom = @"chatRoom";
static NSString *KModuleProfile = @"profile";

static NSString *kSubModuleMembers = @"members";
static NSString *kSubModuleCircles = @"circles";
static NSString *KSubModuleTopic = @"topic";

static NSString *kActionApplied = @"applied";


@implementation WOORoute

@end

@implementation WOORouter

+ (void)handleRoute:(WOORoute *)route {
   
    if (![WOORouter canHandleRoute]) {
        return;
    }
    
//    if ([route.module isEqualToString:kModuleCicrle]) {
//        if ([route.subModule isEqualToString:kSubModuleMembers]) {
//            if ([route.action isEqualToString:kActionApplied]) {
//                // 进入票圈审核列表页面
//                NSString *title = @"";
//                if ([route.paramaters objectForKey:@"title"]) {
//                    title = route.paramaters[@"title"];
//                }
//                CMSPlanetMessageViewController *vc = [[CMSPlanetMessageViewController alloc] initWithPlanetNo:route.key andTitle:title];
//                [[CMSAlertTool WHTopViewController].navigationController pushViewController:vc animated:YES];
//                return;
//            }
//        }
//        if (route.subModuleKey == nil) {
//            // 进入票圈核心流
//            NSString *circleNo = route.key;
//            [CMSCircleService getCircleDetail:circleNo completion:^(CMSCircle *circle, NSError *error) {
//                if (!error) {
//                    [CMSLoginManager sharedManager].currentCircle = circle;
//                    [CMSLoginManager jumpToMainViewController:nil];
//                } else {
//                    NSLog(@"%@", error);
//                }
//            }];
//            return;
//        }
//        return;
//    }
//    if ([route.module isEqualToString:kModuleArticle]) {
//        if (route.subModule == nil) {
//            NSString *articleNo = route.key;
//            [CMSArticleService getArticleByArticleID:articleNo completion:^(CMSRow *model, NSError *error) {
//                if (model) {
//                    CMSNewSimpleCoreflowVC *coreFlowVC = [[CMSNewSimpleCoreflowVC alloc] initWithCircleNo:nil Type:CMSSimpleUserFlowType];
//                    [coreFlowVC layoutRowModels:@[model] atIndex:0];
//                    [[CMSAlertTool WHTopViewController].navigationController pushViewController:coreFlowVC animated:YES];
//                } else {
//                    [CMSHud showString:@"内容不存在"];
//                }
//            }];
//            return;
//        }else if ([route.subModule isEqualToString:KSubModuleTopic]) {
//            NSString * topicNo = route.key;
//            CMSTopicDetailVC * detailVC = [[CMSTopicDetailVC alloc]init];
//            detailVC.topicNo = topicNo;
//            [[CMSAlertTool WHTopViewController].navigationController pushViewController:detailVC animated:YES];
//            return;
//        }
//        return;
//    }
//    if([route.module isEqualToString:kModuleMyMessage]){
//        if (route.subModule==nil) {
//            //跳转到我的消息页面
//            CMSMyMessageViewController *vc = [[CMSMyMessageViewController alloc] init];
//            [[CMSAlertTool WHTopViewController].navigationController pushViewController:vc animated:YES];
//            return;
//        }
//        return;
//    }
//    if ([route.module isEqualToString:KModuleChatRoom]) {
//        if (route.subModule == nil) {
//            [CMSCircleService getCircleDetail:route.key completion:^(CMSCircle *circle, NSError *error) {
//                if (!error) {
//                    if (![[CMSLoginManager sharedManager].currentCircle.circleNo isEqualToString:circle.circleNo]) {
//                        [CMSLoginManager sharedManager].currentCircle = circle;
//                    }
//                    [CMSLoginManager jumpToMainViewController:^(CMSMainViewController *mainViewController) {
//                        [mainViewController showTheChatRoom];
//                    }];
//                }
//            }];
//        }
//        return;
//    }
//    if ([route.module isEqualToString:kModuleCollection]) {
//        if ([route.subModule isEqualToString:kSubModuleCircles]) {
//            if ([route.action isEqualToString:kActionApplied]) {
//                // 进入星系审核列表页面
//                NSString *title = @"";
//                if ([route.paramaters objectForKey:@"title"]) {
//                    title = route.paramaters[@"title"];
//                }
//                CMSGalaxyMessageViewController *vc = [[CMSGalaxyMessageViewController alloc] initWithCollectionNo:route.key andTitle:title];
//                [[CMSAlertTool WHTopViewController].navigationController pushViewController:vc animated:YES];
//                return;
//            }
//        }
//        if (route.subModule == nil) {
//            CMSGalaxyInfoViewController *galaxyVC = [[CMSGalaxyInfoViewController alloc] initWithGalaxyNo:route.key];
//            [[CMSAlertTool WHTopViewController].navigationController pushViewController:galaxyVC animated:YES];
//            return;
//        }
//    }
//    if ([route.module isEqualToString:KModuleProfile]) {
//        if (!route.subModuleKey && route.key) {
//            //跳转到用户个人页面
//            CMSAccountViewController * accountVC = [[CMSAccountViewController alloc]init];
//            accountVC.userno = route.key;
//            [[CMSAlertTool WHTopViewController].navigationController pushViewController:accountVC animated:YES];
//            return;
//        }
//        return;
//    }
}

+ (BOOL)routeURL:(NSURL *)URL {
    return [JLRoutes routeURL:URL];
}

+ (BOOL)canHandleRoute {
    //移除
//    UIView * topView = [[UIApplication sharedApplication].keyWindow.subviews lastObject];
//    if ([topView isKindOfClass:[CMSShareView class]] || [topView isKindOfClass:[CMSCommentListView class]] || [topView isKindOfClass:[CMSForwardPlanetListView class]] ) {
//        [topView removeFromSuperview];
//    }
//    return [CMSLoginManager isAuthModule];
    return YES;
}

@end
