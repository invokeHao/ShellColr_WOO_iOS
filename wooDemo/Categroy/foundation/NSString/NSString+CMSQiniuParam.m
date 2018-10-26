//
//  NSString+CMSQiniuParam.m
//  cosmos
//
//  Created by Lane on 2018/5/15.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSString+CMSQiniuParam.h"

NSString * const CMSQiniuCardImageURLParam = @"?imageView2/0/w/1280";
NSString * const CMSQiniuCardVideoURLParam = @"?vframe/jpg/offset/0";
NSString * const CMSQiniuSmallCardImageURLParam = @"?imageView2/0/w/480";
NSString * const CMSQiniuAvatarImageURLParam = @"?imageView2/0/w/160";
NSString * const CMSQiniuCircleCoverImageURLParam = @"?imageView2/0/w/320";
NSString * const CMSQiniuTopicCoverImageURLParam = @"?imageView2/0/w/828";
NSString * const CMSQiniuBannerImageURLParam = @"?imageView2/0/w/828";

@implementation NSString (CMSQiniuParam)

- (NSURL *)URLByAddParam:(NSString *)paramString {
    NSString *resultString = [self stringByAppendingString:paramString];
    return [NSURL URLWithString:resultString];
}

- (NSURL *)URLByCropWidth:(NSInteger)width {
    if (width > 1280) {
        width = 1280;
    }
    NSInteger height = width * 1.5;
    NSString * pramaStr = FORMAT(@"?imageMogr2/gravity/North/crop/%ldx%ld",width,height);
    return [self URLByAddParam:pramaStr];
}

- (NSURL *)URLByThumbWidth:(NSInteger)width {
    NSInteger height = width * 1.5;
    NSString * pramaStr = FORMAT(@"?imageMogr2/thumbnail/%ldx/gravity/North/crop/%ldx%ld",width,width,height);
    return [self URLByAddParam:pramaStr];
}

- (NSURL *)userAvatarURL {
    return [self URLByAddParam:CMSQiniuAvatarImageURLParam];
}

- (NSURL *)circleCoverURL {
    return [self URLByAddParam:CMSQiniuCircleCoverImageURLParam];
}

- (NSURL *)topicCoverURL {
    return [self URLByAddParam:CMSQiniuTopicCoverImageURLParam];
}

- (NSURL *)smallCardCoverURL {
    return [self URLByAddParam:CMSQiniuSmallCardImageURLParam];
}

@end
