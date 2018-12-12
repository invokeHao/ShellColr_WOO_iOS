//
//	WOOImage.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOOImage.h"

NSString *const kWOOImageHeight = @"height";
NSString *const kWOOImageMimeType = @"mimeType";
NSString *const kWOOImageUrl = @"url";
NSString *const kWOOImageWidth = @"width";

@interface WOOImage ()
@end
@implementation WOOImage




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOOImageHeight] isKindOfClass:[NSNull class]]){
		self.height = [dictionary[kWOOImageHeight] integerValue];
	}

	if(![dictionary[kWOOImageMimeType] isKindOfClass:[NSNull class]]){
		self.mimeType = dictionary[kWOOImageMimeType];
	}	
	if(![dictionary[kWOOImageUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kWOOImageUrl];
	}	
	if(![dictionary[kWOOImageWidth] isKindOfClass:[NSNull class]]){
		self.width = [dictionary[kWOOImageWidth] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kWOOImageHeight] = @(self.height);
	if(self.mimeType != nil){
		dictionary[kWOOImageMimeType] = self.mimeType;
	}
	if(self.url != nil){
		dictionary[kWOOImageUrl] = self.url;
	}
	dictionary[kWOOImageWidth] = @(self.width);
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
	[aCoder encodeObject:@(self.height) forKey:kWOOImageHeight];	if(self.mimeType != nil){
		[aCoder encodeObject:self.mimeType forKey:kWOOImageMimeType];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kWOOImageUrl];
	}
	[aCoder encodeObject:@(self.width) forKey:kWOOImageWidth];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.height = [[aDecoder decodeObjectForKey:kWOOImageHeight] integerValue];
	self.mimeType = [aDecoder decodeObjectForKey:kWOOImageMimeType];
	self.url = [aDecoder decodeObjectForKey:kWOOImageUrl];
	self.width = [[aDecoder decodeObjectForKey:kWOOImageWidth] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOOImage *copy = [WOOImage new];

	copy.height = self.height;
	copy.mimeType = [self.mimeType copy];
	copy.url = [self.url copy];
	copy.width = self.width;

	return copy;
}
@end