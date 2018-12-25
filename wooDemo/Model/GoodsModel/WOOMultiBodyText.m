//
//	WOOMultiBodyText.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOOMultiBodyText.h"

NSString *const kWOOMultiBodyTextImages = @"images";

@interface WOOMultiBodyText ()
@end
@implementation WOOMultiBodyText




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kWOOMultiBodyTextImages] != nil && [dictionary[kWOOMultiBodyTextImages] isKindOfClass:[NSArray class]]){
		NSArray * imagesDictionaries = dictionary[kWOOMultiBodyTextImages];
		NSMutableArray * imagesItems = [NSMutableArray array];
		for(NSDictionary * imagesDictionary in imagesDictionaries){
			WOOImage * imagesItem = [[WOOImage alloc] initWithDictionary:imagesDictionary];
			[imagesItems addObject:imagesItem];
		}
		self.images = imagesItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.images != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(WOOImage * imagesElement in self.images){
			[dictionaryElements addObject:[imagesElement toDictionary]];
		}
		dictionary[kWOOMultiBodyTextImages] = dictionaryElements;
	}
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
	if(self.images != nil){
		[aCoder encodeObject:self.images forKey:kWOOMultiBodyTextImages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.images = [aDecoder decodeObjectForKey:kWOOMultiBodyTextImages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOOMultiBodyText *copy = [WOOMultiBodyText new];

	copy.images = [self.images copy];

	return copy;
}
@end