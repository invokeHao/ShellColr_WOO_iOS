//
//  NSString+CMSQiniuParam.h
//  cosmos
//
//  Created by Lane on 2018/5/15.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString * const CMSQiniuCardImageURLParam;
UIKIT_EXTERN NSString * const CMSQiniuCardLongImageURLParam;
UIKIT_EXTERN NSString * const CMSQiniuCardVideoURLParam;
UIKIT_EXTERN NSString * const CMSQiniuSmallCardImageURLParam;
UIKIT_EXTERN NSString * const CMSQiniuAvatarImageURLParam;
UIKIT_EXTERN NSString * const CMSQiniuCircleCoverImageURLParam;
UIKIT_EXTERN NSString * const CMSQiniuBannerImageURLParam;

@interface NSString (CMSQiniuParam)

- (NSURL *)URLByAddParam:(NSString *)paramString;

- (NSURL *)userAvatarURL;

- (NSURL *)circleCoverURL;

- (NSURL *)topicCoverURL;

- (NSURL *)smallCardCoverURL;

- (NSURL *)URLByThumbWidth:(NSInteger)width;

- (NSURL *)URLByCropWidth:(NSInteger)width;

@end
