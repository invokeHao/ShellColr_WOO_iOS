//
//	WOOProductImage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOOProductImage.h"

NSString *const kWOOProductImageAve = @"ave";
NSString *const kWOOProductImageHeight = @"height";
NSString *const kWOOProductImageMimeType = @"mimeType";
NSString *const kWOOProductImageUrl = @"url";
NSString *const kWOOProductImageWidth = @"width";

@interface WOOProductImage ()
@end
@implementation WOOProductImage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOOProductImageAve] isKindOfClass:[NSNull class]]){
		self.ave = dictionary[kWOOProductImageAve];
	}	
	if(![dictionary[kWOOProductImageHeight] isKindOfClass:[NSNull class]]){
		self.height = [dictionary[kWOOProductImageHeight] integerValue];
	}

	if(![dictionary[kWOOProductImageMimeType] isKindOfClass:[NSNull class]]){
		self.mimeType = dictionary[kWOOProductImageMimeType];
	}	
	if(![dictionary[kWOOProductImageUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kWOOProductImageUrl];
	}	
	if(![dictionary[kWOOProductImageWidth] isKindOfClass:[NSNull class]]){
		self.width = [dictionary[kWOOProductImageWidth] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.ave != nil){
		dictionary[kWOOProductImageAve] = self.ave;
	}
	dictionary[kWOOProductImageHeight] = @(self.height);
	if(self.mimeType != nil){
		dictionary[kWOOProductImageMimeType] = self.mimeType;
	}
	if(self.url != nil){
		dictionary[kWOOProductImageUrl] = self.url;
	}
	dictionary[kWOOProductImageWidth] = @(self.width);
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
	if(self.ave != nil){
		[aCoder encodeObject:self.ave forKey:kWOOProductImageAve];
	}
	[aCoder encodeObject:@(self.height) forKey:kWOOProductImageHeight];	if(self.mimeType != nil){
		[aCoder encodeObject:self.mimeType forKey:kWOOProductImageMimeType];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kWOOProductImageUrl];
	}
	[aCoder encodeObject:@(self.width) forKey:kWOOProductImageWidth];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ave = [aDecoder decodeObjectForKey:kWOOProductImageAve];
	self.height = [[aDecoder decodeObjectForKey:kWOOProductImageHeight] integerValue];
	self.mimeType = [aDecoder decodeObjectForKey:kWOOProductImageMimeType];
	self.url = [aDecoder decodeObjectForKey:kWOOProductImageUrl];
	self.width = [[aDecoder decodeObjectForKey:kWOOProductImageWidth] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOOProductImage *copy = [WOOProductImage new];

	copy.ave = [self.ave copy];
	copy.height = self.height;
	copy.mimeType = [self.mimeType copy];
	copy.url = [self.url copy];
	copy.width = self.width;

	return copy;
}
@end