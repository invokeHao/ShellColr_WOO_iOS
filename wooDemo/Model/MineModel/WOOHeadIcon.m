//
//	WOOHeadIcon.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOOHeadIcon.h"

NSString *const kWOOHeadIconAve = @"ave";
NSString *const kWOOHeadIconHeight = @"height";
NSString *const kWOOHeadIconMimeType = @"mimeType";
NSString *const kWOOHeadIconUrl = @"url";
NSString *const kWOOHeadIconWidth = @"width";

@interface WOOHeadIcon ()
@end
@implementation WOOHeadIcon




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOOHeadIconAve] isKindOfClass:[NSNull class]]){
		self.ave = dictionary[kWOOHeadIconAve];
	}	
	if(![dictionary[kWOOHeadIconHeight] isKindOfClass:[NSNull class]]){
		self.height = [dictionary[kWOOHeadIconHeight] integerValue];
	}

	if(![dictionary[kWOOHeadIconMimeType] isKindOfClass:[NSNull class]]){
		self.mimeType = dictionary[kWOOHeadIconMimeType];
	}	
	if(![dictionary[kWOOHeadIconUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kWOOHeadIconUrl];
	}	
	if(![dictionary[kWOOHeadIconWidth] isKindOfClass:[NSNull class]]){
		self.width = [dictionary[kWOOHeadIconWidth] integerValue];
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
		dictionary[kWOOHeadIconAve] = self.ave;
	}
	dictionary[kWOOHeadIconHeight] = @(self.height);
	if(self.mimeType != nil){
		dictionary[kWOOHeadIconMimeType] = self.mimeType;
	}
	if(self.url != nil){
		dictionary[kWOOHeadIconUrl] = self.url;
	}
	dictionary[kWOOHeadIconWidth] = @(self.width);
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
		[aCoder encodeObject:self.ave forKey:kWOOHeadIconAve];
	}
	[aCoder encodeObject:@(self.height) forKey:kWOOHeadIconHeight];	if(self.mimeType != nil){
		[aCoder encodeObject:self.mimeType forKey:kWOOHeadIconMimeType];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:kWOOHeadIconUrl];
	}
	[aCoder encodeObject:@(self.width) forKey:kWOOHeadIconWidth];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ave = [aDecoder decodeObjectForKey:kWOOHeadIconAve];
	self.height = [[aDecoder decodeObjectForKey:kWOOHeadIconHeight] integerValue];
	self.mimeType = [aDecoder decodeObjectForKey:kWOOHeadIconMimeType];
	self.url = [aDecoder decodeObjectForKey:kWOOHeadIconUrl];
	self.width = [[aDecoder decodeObjectForKey:kWOOHeadIconWidth] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOOHeadIcon *copy = [WOOHeadIcon new];

	copy.ave = [self.ave copy];
	copy.height = self.height;
	copy.mimeType = [self.mimeType copy];
	copy.url = [self.url copy];
	copy.width = self.width;

	return copy;
}
@end