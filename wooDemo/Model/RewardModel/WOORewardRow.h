#import <UIKit/UIKit.h>
#import "WOOProductImage.h"

@interface WOORewardRow : NSObject

@property (nonatomic, strong) NSString * articleId;
@property (nonatomic, strong) NSString * orderId;
@property (nonatomic, assign) NSInteger orderStatus;
@property (nonatomic, assign) NSInteger payCoinAmount;
@property (nonatomic, assign) NSInteger priceAmount;
@property (nonatomic, strong) WOOProductImage * productImage;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, assign) NSInteger rewardAmount;
@property (nonatomic, strong) NSString * rewardBuyUrl;
@property (nonatomic, assign) NSInteger rewardDeliverStatus;
@property (nonatomic, assign) NSInteger createDate;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
