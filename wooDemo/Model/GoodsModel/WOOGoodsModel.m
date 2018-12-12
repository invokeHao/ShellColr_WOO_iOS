//
//	WOOGoodsModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import "WOOGoodsModel.h"

NSString *const kWOOGoodsModelArticleId = @"articleId";
NSString *const kWOOGoodsModelCommentTimes = @"commentTimes";
NSString *const kWOOGoodsModelCommented = @"commented";
NSString *const kWOOGoodsModelCreateDate = @"createDate";
NSString *const kWOOGoodsModelFavorTimes = @"favorTimes";
NSString *const kWOOGoodsModelFavored = @"favored";
NSString *const kWOOGoodsModelFormatType = @"formatType";
NSString *const kWOOGoodsModelFunctionType = @"functionType";
NSString *const kWOOGoodsModelLikeTimes = @"likeTimes";
NSString *const kWOOGoodsModelLiked = @"liked";
NSString *const kWOOGoodsModelMultiBodyText = @"multiBodyText";
NSString *const kWOOGoodsModelOriginalUrl = @"originalUrl";
NSString *const kWOOGoodsModelOwnerId = @"ownerId";
NSString *const kWOOGoodsModelPostType = @"postType";
NSString *const kWOOGoodsModelProductCommissionAmount = @"productCommissionAmount";
NSString *const kWOOGoodsModelProductCommissionRate = @"productCommissionRate";
NSString *const kWOOGoodsModelProductPriceAmount = @"productPriceAmount";
NSString *const kWOOGoodsModelRead = @"read";
NSString *const kWOOGoodsModelRootArticleId = @"rootArticleId";
NSString *const kWOOGoodsModelTitle = @"title";
NSString *const kWOOGoodsModelUnlikeTimes = @"unlikeTimes";
NSString *const kWOOGoodsModelUnliked = @"unliked";

@interface WOOGoodsModel ()
@end
@implementation WOOGoodsModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOOGoodsModelArticleId] isKindOfClass:[NSNull class]]){
		self.articleId = dictionary[kWOOGoodsModelArticleId];
	}	
	if(![dictionary[kWOOGoodsModelCommentTimes] isKindOfClass:[NSNull class]]){
		self.commentTimes = [dictionary[kWOOGoodsModelCommentTimes] integerValue];
	}

	if(![dictionary[kWOOGoodsModelCommented] isKindOfClass:[NSNull class]]){
		self.commented = [dictionary[kWOOGoodsModelCommented] boolValue];
	}

	if(![dictionary[kWOOGoodsModelCreateDate] isKindOfClass:[NSNull class]]){
		self.createDate = [dictionary[kWOOGoodsModelCreateDate] integerValue];
	}

	if(![dictionary[kWOOGoodsModelFavorTimes] isKindOfClass:[NSNull class]]){
		self.favorTimes = [dictionary[kWOOGoodsModelFavorTimes] integerValue];
	}

	if(![dictionary[kWOOGoodsModelFavored] isKindOfClass:[NSNull class]]){
		self.favored = [dictionary[kWOOGoodsModelFavored] boolValue];
	}

	if(![dictionary[kWOOGoodsModelFormatType] isKindOfClass:[NSNull class]]){
		self.formatType = [dictionary[kWOOGoodsModelFormatType] integerValue];
	}

	if(![dictionary[kWOOGoodsModelFunctionType] isKindOfClass:[NSNull class]]){
		self.functionType = [dictionary[kWOOGoodsModelFunctionType] integerValue];
	}

	if(![dictionary[kWOOGoodsModelLikeTimes] isKindOfClass:[NSNull class]]){
		self.likeTimes = [dictionary[kWOOGoodsModelLikeTimes] integerValue];
	}

	if(![dictionary[kWOOGoodsModelLiked] isKindOfClass:[NSNull class]]){
		self.liked = [dictionary[kWOOGoodsModelLiked] boolValue];
	}

	if(![dictionary[kWOOGoodsModelMultiBodyText] isKindOfClass:[NSNull class]]){
		self.multiBodyText = [[WOOMultiBodyText alloc] initWithDictionary:dictionary[kWOOGoodsModelMultiBodyText]];
	}

	if(![dictionary[kWOOGoodsModelOriginalUrl] isKindOfClass:[NSNull class]]){
		self.originalUrl = dictionary[kWOOGoodsModelOriginalUrl];
	}	
	if(![dictionary[kWOOGoodsModelOwnerId] isKindOfClass:[NSNull class]]){
		self.ownerId = dictionary[kWOOGoodsModelOwnerId];
	}	
	if(![dictionary[kWOOGoodsModelPostType] isKindOfClass:[NSNull class]]){
		self.postType = [dictionary[kWOOGoodsModelPostType] integerValue];
	}

	if(![dictionary[kWOOGoodsModelProductCommissionAmount] isKindOfClass:[NSNull class]]){
		self.productCommissionAmount = [dictionary[kWOOGoodsModelProductCommissionAmount] floatValue];
	}

	if(![dictionary[kWOOGoodsModelProductCommissionRate] isKindOfClass:[NSNull class]]){
		self.productCommissionRate = [dictionary[kWOOGoodsModelProductCommissionRate] floatValue];
	}

	if(![dictionary[kWOOGoodsModelProductPriceAmount] isKindOfClass:[NSNull class]]){
		self.productPriceAmount = [dictionary[kWOOGoodsModelProductPriceAmount] integerValue];
	}

	if(![dictionary[kWOOGoodsModelRead] isKindOfClass:[NSNull class]]){
		self.read = [dictionary[kWOOGoodsModelRead] boolValue];
	}

	if(![dictionary[kWOOGoodsModelRootArticleId] isKindOfClass:[NSNull class]]){
		self.rootArticleId = dictionary[kWOOGoodsModelRootArticleId];
	}	
	if(![dictionary[kWOOGoodsModelTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kWOOGoodsModelTitle];
	}	
	if(![dictionary[kWOOGoodsModelUnlikeTimes] isKindOfClass:[NSNull class]]){
		self.unlikeTimes = [dictionary[kWOOGoodsModelUnlikeTimes] integerValue];
	}

	if(![dictionary[kWOOGoodsModelUnliked] isKindOfClass:[NSNull class]]){
		self.unliked = [dictionary[kWOOGoodsModelUnliked] boolValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.articleId != nil){
		dictionary[kWOOGoodsModelArticleId] = self.articleId;
	}
	dictionary[kWOOGoodsModelCommentTimes] = @(self.commentTimes);
	dictionary[kWOOGoodsModelCommented] = @(self.commented);
	dictionary[kWOOGoodsModelCreateDate] = @(self.createDate);
	dictionary[kWOOGoodsModelFavorTimes] = @(self.favorTimes);
	dictionary[kWOOGoodsModelFavored] = @(self.favored);
	dictionary[kWOOGoodsModelFormatType] = @(self.formatType);
	dictionary[kWOOGoodsModelFunctionType] = @(self.functionType);
	dictionary[kWOOGoodsModelLikeTimes] = @(self.likeTimes);
	dictionary[kWOOGoodsModelLiked] = @(self.liked);
	if(self.multiBodyText != nil){
		dictionary[kWOOGoodsModelMultiBodyText] = [self.multiBodyText toDictionary];
	}
	if(self.originalUrl != nil){
		dictionary[kWOOGoodsModelOriginalUrl] = self.originalUrl;
	}
	if(self.ownerId != nil){
		dictionary[kWOOGoodsModelOwnerId] = self.ownerId;
	}
	dictionary[kWOOGoodsModelPostType] = @(self.postType);
	dictionary[kWOOGoodsModelProductCommissionAmount] = @(self.productCommissionAmount);
	dictionary[kWOOGoodsModelProductCommissionRate] = @(self.productCommissionRate);
	dictionary[kWOOGoodsModelProductPriceAmount] = @(self.productPriceAmount);
	dictionary[kWOOGoodsModelRead] = @(self.read);
	if(self.rootArticleId != nil){
		dictionary[kWOOGoodsModelRootArticleId] = self.rootArticleId;
	}
	if(self.title != nil){
		dictionary[kWOOGoodsModelTitle] = self.title;
	}
	dictionary[kWOOGoodsModelUnlikeTimes] = @(self.unlikeTimes);
	dictionary[kWOOGoodsModelUnliked] = @(self.unliked);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.articleId != nil){
		[aCoder encodeObject:self.articleId forKey:kWOOGoodsModelArticleId];
	}
	[aCoder encodeObject:@(self.commentTimes) forKey:kWOOGoodsModelCommentTimes];	[aCoder encodeObject:@(self.commented) forKey:kWOOGoodsModelCommented];	[aCoder encodeObject:@(self.createDate) forKey:kWOOGoodsModelCreateDate];	[aCoder encodeObject:@(self.favorTimes) forKey:kWOOGoodsModelFavorTimes];	[aCoder encodeObject:@(self.favored) forKey:kWOOGoodsModelFavored];	[aCoder encodeObject:@(self.formatType) forKey:kWOOGoodsModelFormatType];	[aCoder encodeObject:@(self.functionType) forKey:kWOOGoodsModelFunctionType];	[aCoder encodeObject:@(self.likeTimes) forKey:kWOOGoodsModelLikeTimes];	[aCoder encodeObject:@(self.liked) forKey:kWOOGoodsModelLiked];	if(self.multiBodyText != nil){
		[aCoder encodeObject:self.multiBodyText forKey:kWOOGoodsModelMultiBodyText];
	}
	if(self.originalUrl != nil){
		[aCoder encodeObject:self.originalUrl forKey:kWOOGoodsModelOriginalUrl];
	}
	if(self.ownerId != nil){
		[aCoder encodeObject:self.ownerId forKey:kWOOGoodsModelOwnerId];
	}
	[aCoder encodeObject:@(self.postType) forKey:kWOOGoodsModelPostType];	[aCoder encodeObject:@(self.productCommissionAmount) forKey:kWOOGoodsModelProductCommissionAmount];	[aCoder encodeObject:@(self.productCommissionRate) forKey:kWOOGoodsModelProductCommissionRate];	[aCoder encodeObject:@(self.productPriceAmount) forKey:kWOOGoodsModelProductPriceAmount];	[aCoder encodeObject:@(self.read) forKey:kWOOGoodsModelRead];	if(self.rootArticleId != nil){
		[aCoder encodeObject:self.rootArticleId forKey:kWOOGoodsModelRootArticleId];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kWOOGoodsModelTitle];
	}
	[aCoder encodeObject:@(self.unlikeTimes) forKey:kWOOGoodsModelUnlikeTimes];	[aCoder encodeObject:@(self.unliked) forKey:kWOOGoodsModelUnliked];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.articleId = [aDecoder decodeObjectForKey:kWOOGoodsModelArticleId];
	self.commentTimes = [[aDecoder decodeObjectForKey:kWOOGoodsModelCommentTimes] integerValue];
	self.commented = [[aDecoder decodeObjectForKey:kWOOGoodsModelCommented] boolValue];
	self.createDate = [[aDecoder decodeObjectForKey:kWOOGoodsModelCreateDate] integerValue];
	self.favorTimes = [[aDecoder decodeObjectForKey:kWOOGoodsModelFavorTimes] integerValue];
	self.favored = [[aDecoder decodeObjectForKey:kWOOGoodsModelFavored] boolValue];
	self.formatType = [[aDecoder decodeObjectForKey:kWOOGoodsModelFormatType] integerValue];
	self.functionType = [[aDecoder decodeObjectForKey:kWOOGoodsModelFunctionType] integerValue];
	self.likeTimes = [[aDecoder decodeObjectForKey:kWOOGoodsModelLikeTimes] integerValue];
	self.liked = [[aDecoder decodeObjectForKey:kWOOGoodsModelLiked] boolValue];
	self.multiBodyText = [aDecoder decodeObjectForKey:kWOOGoodsModelMultiBodyText];
	self.originalUrl = [aDecoder decodeObjectForKey:kWOOGoodsModelOriginalUrl];
	self.ownerId = [aDecoder decodeObjectForKey:kWOOGoodsModelOwnerId];
	self.postType = [[aDecoder decodeObjectForKey:kWOOGoodsModelPostType] integerValue];
	self.productCommissionAmount = [[aDecoder decodeObjectForKey:kWOOGoodsModelProductCommissionAmount] floatValue];
	self.productCommissionRate = [[aDecoder decodeObjectForKey:kWOOGoodsModelProductCommissionRate] floatValue];
	self.productPriceAmount = [[aDecoder decodeObjectForKey:kWOOGoodsModelProductPriceAmount] integerValue];
	self.read = [[aDecoder decodeObjectForKey:kWOOGoodsModelRead] boolValue];
	self.rootArticleId = [aDecoder decodeObjectForKey:kWOOGoodsModelRootArticleId];
	self.title = [aDecoder decodeObjectForKey:kWOOGoodsModelTitle];
	self.unlikeTimes = [[aDecoder decodeObjectForKey:kWOOGoodsModelUnlikeTimes] integerValue];
	self.unliked = [[aDecoder decodeObjectForKey:kWOOGoodsModelUnliked] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOOGoodsModel *copy = [WOOGoodsModel new];

	copy.articleId = [self.articleId copy];
	copy.commentTimes = self.commentTimes;
	copy.commented = self.commented;
	copy.createDate = self.createDate;
	copy.favorTimes = self.favorTimes;
	copy.favored = self.favored;
	copy.formatType = self.formatType;
	copy.functionType = self.functionType;
	copy.likeTimes = self.likeTimes;
	copy.liked = self.liked;
	copy.multiBodyText = [self.multiBodyText copy];
	copy.originalUrl = [self.originalUrl copy];
	copy.ownerId = [self.ownerId copy];
	copy.postType = self.postType;
	copy.productCommissionAmount = self.productCommissionAmount;
	copy.productCommissionRate = self.productCommissionRate;
	copy.productPriceAmount = self.productPriceAmount;
	copy.read = self.read;
	copy.rootArticleId = [self.rootArticleId copy];
	copy.title = [self.title copy];
	copy.unlikeTimes = self.unlikeTimes;
	copy.unliked = self.unliked;

	return copy;
}

- (CGFloat)cellHeight {
    CGFloat coverH = 360 * VERTICAL_SCREEN_WIDTH / 414;
    CGFloat textH = [self.title sizeWithFont:WOOFont(24) maxSize:CGSizeMake(VERTICAL_SCREEN_WIDTH - 90, MAXFLOAT)].height;
    return coverH + textH + 40;
}

@end
