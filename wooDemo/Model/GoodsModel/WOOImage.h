#import <UIKit/UIKit.h>
#import "WOOBaseModel.h"

@interface WOOImage : WOOBaseModel

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * mimeType;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, assign) NSInteger width;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end