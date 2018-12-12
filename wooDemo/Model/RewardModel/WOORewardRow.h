#import <UIKit/UIKit.h>
#import "WOOProductImage.h"

typedef NS_ENUM(NSUInteger, WOOOrderStatusType) {
    WOOOrderStatusTypeDefault,
    WOOOrderStatusTypeCancel,
    WOOOrderStatusTypePayed,
//    WOOOrderStatusType
};

@interface WOORewardRow : NSObject

@property (nonatomic, strong) NSString * articleId;
@property (nonatomic, strong) NSString * orderId;
@property (nonatomic, assign) NSInteger orderStatus; //0：初始，-11：取消，11：已付款，21：已发货，31：已确认收货
@property (nonatomic, assign) NSInteger payCoinAmount;
@property (nonatomic, assign) NSInteger priceAmount;
@property (nonatomic, strong) WOOProductImage * productImage;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, assign) NSInteger rewardAmount;
@property (nonatomic, strong) NSString * rewardBuyUrl;
@property (nonatomic, assign) NSInteger rewardDeliverStatus; //0：未到账，1：已到账
@property (nonatomic, assign) NSInteger createDate;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
