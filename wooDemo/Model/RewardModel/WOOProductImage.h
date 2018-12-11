#import <UIKit/UIKit.h>

@interface WOOProductImage : NSObject

@property (nonatomic, strong) NSString * ave;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * mimeType;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, assign) NSInteger width;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
