#import <UIKit/UIKit.h>

@interface WOORange : NSObject

@property (nonatomic, assign) NSInteger endRowIdx;
@property (nonatomic, assign) NSInteger startRowIdx;
@property (nonatomic, assign) NSInteger totalRows;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end