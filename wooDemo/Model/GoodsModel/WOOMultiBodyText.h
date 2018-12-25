#import <UIKit/UIKit.h>
#import "WOOBaseModel.h"
#import "WOOImage.h"

@interface WOOMultiBodyText : WOOBaseModel

@property (nonatomic, strong) NSArray * images;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end