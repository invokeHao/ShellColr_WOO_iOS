//
//  WOOMainFlowModel.m
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMainFlowModel.h"

NSString *const KWOOMainFLowArticleArray = @"data";
NSString *const KWOOMainFLowTotalNumber = @"total_number";
NSString *const KWOOMainFLowHasMore = @"has_more";
NSString *const KWOOMainFLowLoginStatus = @"login_status";
NSString *const KWOOMainFLowShowEtStatus = @"show_et_status";
NSString *const KWOOMainFLowPostContentHint = @"post_content_hint";
NSString *const KWOOMainFLowHasMoreToRefresh = @"has_more_to_refresh";
NSString *const KWOOMainFLowActionToLastStick = @"action_to_last_stick";
NSString *const KWOOMainFLowFeedFlag = @"feed_flag";
NSString *const KWOOMainFLowTips = @"tips";


@implementation WOOMainFlowModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (dictionary[KWOOMainFLowArticleArray] != nil && [dictionary[KWOOMainFLowArticleArray] isKindOfClass:[NSArray class]]) {
        NSArray * articleArr = dictionary[KWOOMainFLowArticleArray];
        NSMutableArray *articleItems = [NSMutableArray array];
        for (NSDictionary * articleDic in articleArr) {
            WOOArticleModel * article = [[WOOArticleModel alloc]initWithDictionary:articleDic];
            [articleItems addObject:article];
        }
        self.articleArray = articleItems;
    }
    if (![dictionary[KWOOMainFLowTotalNumber] isKindOfClass:[NSNull class]]) {
        self.total_number = [dictionary[KWOOMainFLowTotalNumber] integerValue];
    }
    if (![dictionary[KWOOMainFLowHasMore] isKindOfClass:[NSNull class]]) {
        self.has_more = [dictionary[KWOOMainFLowHasMore] boolValue];
    }
    if (![dictionary[KWOOMainFLowLoginStatus] isKindOfClass:[NSNull class]]) {
        self.login_status = [dictionary[KWOOMainFLowLoginStatus] integerValue];
    }
    if (![dictionary[KWOOMainFLowShowEtStatus] isKindOfClass:[NSNull class]]) {
        self.show_et_status = [dictionary[KWOOMainFLowShowEtStatus] integerValue];
    }
    if (![dictionary[KWOOMainFLowPostContentHint] isKindOfClass:[NSNull class]]) {
        self.post_content_hint = dictionary[KWOOMainFLowPostContentHint];
    }
    if (![dictionary[KWOOMainFLowHasMoreToRefresh] isKindOfClass:[NSNull class]]) {
        self.has_more_to_refresh = [dictionary[KWOOMainFLowHasMoreToRefresh] boolValue];
    }
    if (![dictionary[KWOOMainFLowActionToLastStick] isKindOfClass:[NSNull class]]) {
        self.login_status = [dictionary[KWOOMainFLowActionToLastStick] integerValue];
    }
    if (![dictionary[KWOOMainFLowFeedFlag] isKindOfClass:[NSNull class]]) {
        self.login_status = [dictionary[KWOOMainFLowFeedFlag] integerValue];
    }
    if (![dictionary[KWOOMainFLowTips] isKindOfClass:[NSNull class]]) {
        self.tips = [[WOOTipsModel alloc]initWithDictionary:dictionary[KWOOMainFLowTips]];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if (self.articleArray != nil) {
        NSMutableArray * itemArr = [NSMutableArray array];
        for (WOOArticleModel * model in self.articleArray) {
            NSDictionary * dic = [model toDictionary];
            [itemArr addObject:dic];
        }
        dictionary[KWOOMainFLowArticleArray] = itemArr;
    }
    
    dictionary[KWOOMainFLowTotalNumber] = @(self.total_number);
    dictionary[KWOOMainFLowHasMore] = @(self.has_more);
    dictionary[KWOOMainFLowLoginStatus] = @(self.login_status);
    dictionary[KWOOMainFLowShowEtStatus] = @(self.show_et_status);
    if (dictionary[KWOOMainFLowPostContentHint] != nil) {
        dictionary[KWOOMainFLowPostContentHint] = self.post_content_hint;
    }
    dictionary[KWOOMainFLowHasMoreToRefresh] = @(self.has_more_to_refresh);
    dictionary[KWOOMainFLowActionToLastStick] = @(self.action_to_last_stick);
    dictionary[KWOOMainFLowFeedFlag] = @(self.feed_flag);
    if (dictionary[KWOOMainFLowTips] != nil) {
        dictionary[KWOOMainFLowTips] = [self.tips toDictionary];
    }
    return dictionary;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.articleArray != nil) {
        [aCoder encodeObject:self.articleArray forKey:KWOOMainFLowArticleArray];
    }
    [aCoder encodeObject:@(self.total_number) forKey:KWOOMainFLowTotalNumber];
    [aCoder encodeObject:@(self.has_more) forKey:KWOOMainFLowHasMore];
    [aCoder encodeObject:@(self.login_status) forKey:KWOOMainFLowLoginStatus];
    [aCoder encodeObject:@(self.show_et_status) forKey:KWOOMainFLowShowEtStatus];
    if (self.post_content_hint != nil) {
        [aCoder encodeObject:self.post_content_hint forKey:KWOOMainFLowPostContentHint];
    }
    [aCoder encodeObject:@(self.has_more_to_refresh) forKey:KWOOMainFLowHasMoreToRefresh];
    [aCoder encodeObject:@(self.action_to_last_stick) forKey:KWOOMainFLowActionToLastStick];
    [aCoder encodeObject:@(self.feed_flag) forKey:KWOOMainFLowFeedFlag];
    if (self.tips != nil) {
        [aCoder encodeObject:self.tips forKey:KWOOMainFLowTips];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.articleArray = [aDecoder decodeObjectForKey:KWOOMainFLowArticleArray];
    self.total_number = [[aDecoder decodeObjectForKey:KWOOMainFLowTotalNumber] integerValue];
    self.has_more = [[aDecoder decodeObjectForKey:KWOOMainFLowHasMore] boolValue];
    self.login_status = [[aDecoder decodeObjectForKey:KWOOMainFLowLoginStatus] integerValue];
    self.show_et_status = [[aDecoder decodeObjectForKey:KWOOMainFLowShowEtStatus] integerValue];
    self.post_content_hint = [aDecoder decodeObjectForKey:KWOOMainFLowPostContentHint];
    self.has_more_to_refresh = [[aDecoder decodeObjectForKey:KWOOMainFLowHasMore] boolValue];
    self.action_to_last_stick = [[aDecoder decodeObjectForKey:KWOOMainFLowActionToLastStick] integerValue];
    self.feed_flag = [[aDecoder decodeObjectForKey:KWOOMainFLowFeedFlag] integerValue];
    self.tips = [aDecoder decodeObjectForKey:KWOOMainFLowTips];
    
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOMainFlowModel *copy = [WOOMainFlowModel new];
    
    copy.articleArray = [self.articleArray copy];
    copy.total_number = self.total_number;
    copy.has_more = self.has_more;
    copy.login_status = self.login_status;
    copy.show_et_status = self.show_et_status;
    copy.post_content_hint = [self.post_content_hint copy];
    copy.has_more_to_refresh = self.has_more_to_refresh;
    copy.action_to_last_stick = self.action_to_last_stick;
    copy.feed_flag = self.feed_flag;
    copy.tips = [self.tips copy];
    
    return copy;
}


@end
