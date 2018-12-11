#import <UIKit/UIKit.h>
#import "WOORange.h"
#import "WOORewardRow.h"

@interface WOORewardModel : NSObject

@property (nonatomic, strong) WOORange * range;
@property (nonatomic, strong) NSArray * rows;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
