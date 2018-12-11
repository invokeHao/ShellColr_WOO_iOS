//
//	WOORootClass.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOORewardModel.h"

NSString *const kWOORootClassRange = @"range";
NSString *const kWOORootClassRows = @"rows";

@interface WOORewardModel ()
@end
@implementation WOORewardModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOORootClassRange] isKindOfClass:[NSNull class]]){
		self.range = [[WOORange alloc] initWithDictionary:dictionary[kWOORootClassRange]];
	}

	if(dictionary[kWOORootClassRows] != nil && [dictionary[kWOORootClassRows] isKindOfClass:[NSArray class]]){
		NSArray * rowsDictionaries = dictionary[kWOORootClassRows];
		NSMutableArray * rowsItems = [NSMutableArray array];
		for(NSDictionary * rowsDictionary in rowsDictionaries){
			WOORewardRow * rowsItem = [[WOORewardRow alloc] initWithDictionary:rowsDictionary];
			[rowsItems addObject:rowsItem];
		}
		self.rows = rowsItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.range != nil){
		dictionary[kWOORootClassRange] = [self.range toDictionary];
	}
	if(self.rows != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(WOORewardRow * rowsElement in self.rows){
			[dictionaryElements addObject:[rowsElement toDictionary]];
		}
		dictionary[kWOORootClassRows] = dictionaryElements;
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
	if(self.range != nil){
		[aCoder encodeObject:self.range forKey:kWOORootClassRange];
	}
	if(self.rows != nil){
		[aCoder encodeObject:self.rows forKey:kWOORootClassRows];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.range = [aDecoder decodeObjectForKey:kWOORootClassRange];
	self.rows = [aDecoder decodeObjectForKey:kWOORootClassRows];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOORewardModel *copy = [WOORewardModel new];

	copy.range = [self.range copy];
	copy.rows = [self.rows copy];

	return copy;
}
@end
