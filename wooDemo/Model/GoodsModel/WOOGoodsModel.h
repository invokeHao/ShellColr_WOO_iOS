#import <UIKit/UIKit.h>
#import "WOOBaseModel.h"
#import "WOOMultiBodyText.h"

@interface WOOGoodsModel : WOOBaseModel

@property (nonatomic, strong) NSString * articleId;
@property (nonatomic, assign) NSInteger commentTimes;
@property (nonatomic, assign) BOOL commented;
@property (nonatomic, assign) NSInteger createDate;
@property (nonatomic, assign) NSInteger favorTimes;
@property (nonatomic, assign) BOOL favored;
@property (nonatomic, assign) NSInteger formatType;
@property (nonatomic, assign) NSInteger functionType;
@property (nonatomic, assign) NSInteger likeTimes;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) WOOMultiBodyText * multiBodyText;
@property (nonatomic, strong) NSString * originalUrl;
@property (nonatomic, strong) NSString * ownerId;
@property (nonatomic, assign) NSInteger postType;
@property (nonatomic, assign) CGFloat productCommissionAmount;
@property (nonatomic, assign) CGFloat productCommissionRate;
@property (nonatomic, assign) NSInteger productPriceAmount;
@property (nonatomic, assign) BOOL read;
@property (nonatomic, strong) NSString * rootArticleId;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger unlikeTimes;
@property (nonatomic, assign) BOOL unliked;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

- (CGFloat)cellHeight;
@end
