//
//	WOORange.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOORange.h"

NSString *const kWOORangeEndRowIdx = @"endRowIdx";
NSString *const kWOORangeStartRowIdx = @"startRowIdx";
NSString *const kWOORangeTotalRows = @"totalRows";

@interface WOORange ()
@end
@implementation WOORange




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWOORangeEndRowIdx] isKindOfClass:[NSNull class]]){
		self.endRowIdx = [dictionary[kWOORangeEndRowIdx] integerValue];
	}

	if(![dictionary[kWOORangeStartRowIdx] isKindOfClass:[NSNull class]]){
		self.startRowIdx = [dictionary[kWOORangeStartRowIdx] integerValue];
	}

	if(![dictionary[kWOORangeTotalRows] isKindOfClass:[NSNull class]]){
		self.totalRows = [dictionary[kWOORangeTotalRows] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kWOORangeEndRowIdx] = @(self.endRowIdx);
	dictionary[kWOORangeStartRowIdx] = @(self.startRowIdx);
	dictionary[kWOORangeTotalRows] = @(self.totalRows);
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
	[aCoder encodeObject:@(self.endRowIdx) forKey:kWOORangeEndRowIdx];	[aCoder encodeObject:@(self.startRowIdx) forKey:kWOORangeStartRowIdx];	[aCoder encodeObject:@(self.totalRows) forKey:kWOORangeTotalRows];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.endRowIdx = [[aDecoder decodeObjectForKey:kWOORangeEndRowIdx] integerValue];
	self.startRowIdx = [[aDecoder decodeObjectForKey:kWOORangeStartRowIdx] integerValue];
	self.totalRows = [[aDecoder decodeObjectForKey:kWOORangeTotalRows] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WOORange *copy = [WOORange new];

	copy.endRowIdx = self.endRowIdx;
	copy.startRowIdx = self.startRowIdx;
	copy.totalRows = self.totalRows;

	return copy;
}
@end