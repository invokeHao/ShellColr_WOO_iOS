//
//	WOORow.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WOORewardRow.h"

NSString *const kWOORowArticleId = @"articleId";
NSString *const kWOORowOrderId = @"orderId";
NSString *const kWOORowOrderStatus = @"orderStatus";
NSString *const kWOORowPayCoinAmount = @"payCoinAmount";
NSString *const kWOORowPriceAmount = @"priceAmount";
NSString *const kWOORowProductImage = @"productImage";
NSString *const kWOORowProductName = @"productName";
NSString *const kWOORowRewardAmount = @"rewardAmount";
NSString *const kWOORowRewardBuyUrl = @"rewardBuyUrl";
NSString *const kWOORowRewardDeliverStatus = @"rewardDeliverStatus";
NSString *const kWOORowCreateDate = @"createDate";


@interface WOORewardRow ()
@end
@implementation WOORewardRow




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOORowArticleId] isKindOfClass:[NSNull class]]){
        self.articleId = dictionary[kWOORowArticleId];
    }
    if(![dictionary[kWOORowCreateDate] isKindOfClass:[NSNull class]]){
        self.createDate = [dictionary[kWOORowCreateDate] integerValue];
    }
    if(![dictionary[kWOORowOrderId] isKindOfClass:[NSNull class]]){
        self.orderId = dictionary[kWOORowOrderId];
    }
    if(![dictionary[kWOORowOrderStatus] isKindOfClass:[NSNull class]]){
        self.orderStatus = [dictionary[kWOORowOrderStatus] integerValue];
    }
    
    if(![dictionary[kWOORowPayCoinAmount] isKindOfClass:[NSNull class]]){
        self.payCoinAmount = [dictionary[kWOORowPayCoinAmount] integerValue];
    }
    
    if(![dictionary[kWOORowPriceAmount] isKindOfClass:[NSNull class]]){
        self.priceAmount = [dictionary[kWOORowPriceAmount] integerValue];
    }
    
    if(![dictionary[kWOORowProductImage] isKindOfClass:[NSNull class]]){
        self.productImage = [[WOOProductImage alloc] initWithDictionary:dictionary[kWOORowProductImage]];
    }
    
    if(![dictionary[kWOORowProductName] isKindOfClass:[NSNull class]]){
        self.productName = dictionary[kWOORowProductName];
    }
    if(![dictionary[kWOORowRewardAmount] isKindOfClass:[NSNull class]]){
        self.rewardAmount = [dictionary[kWOORowRewardAmount] integerValue];
    }
    
    if(![dictionary[kWOORowRewardBuyUrl] isKindOfClass:[NSNull class]]){
        self.rewardBuyUrl = dictionary[kWOORowRewardBuyUrl];
    }
    if(![dictionary[kWOORowRewardDeliverStatus] isKindOfClass:[NSNull class]]){
        self.rewardDeliverStatus = [dictionary[kWOORowRewardDeliverStatus] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.articleId != nil){
        dictionary[kWOORowArticleId] = self.articleId;
    }
    dictionary[kWOORowCreateDate] = @(self.createDate);
    if(self.orderId != nil){
        dictionary[kWOORowOrderId] = self.orderId;
    }
    dictionary[kWOORowOrderStatus] = @(self.orderStatus);
    dictionary[kWOORowPayCoinAmount] = @(self.payCoinAmount);
    dictionary[kWOORowPriceAmount] = @(self.priceAmount);
    if(self.productImage != nil){
        dictionary[kWOORowProductImage] = [self.productImage toDictionary];
    }
    if(self.productName != nil){
        dictionary[kWOORowProductName] = self.productName;
    }
    dictionary[kWOORowRewardAmount] = @(self.rewardAmount);
    if(self.rewardBuyUrl != nil){
        dictionary[kWOORowRewardBuyUrl] = self.rewardBuyUrl;
    }
    dictionary[kWOORowRewardDeliverStatus] = @(self.rewardDeliverStatus);
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
    if(self.articleId != nil){
        [aCoder encodeObject:self.articleId forKey:kWOORowArticleId];
    }

    [aCoder encodeObject:@(self.createDate) forKey:kWOORowCreateDate];
    if(self.orderId != nil){
        [aCoder encodeObject:self.orderId forKey:kWOORowOrderId];
    }
    [aCoder encodeObject:@(self.orderStatus) forKey:kWOORowOrderStatus];    [aCoder encodeObject:@(self.payCoinAmount) forKey:kWOORowPayCoinAmount];    [aCoder encodeObject:@(self.priceAmount) forKey:kWOORowPriceAmount];    if(self.productImage != nil){
        [aCoder encodeObject:self.productImage forKey:kWOORowProductImage];
    }
    if(self.productName != nil){
        [aCoder encodeObject:self.productName forKey:kWOORowProductName];
    }
    [aCoder encodeObject:@(self.rewardAmount) forKey:kWOORowRewardAmount];    if(self.rewardBuyUrl != nil){
        [aCoder encodeObject:self.rewardBuyUrl forKey:kWOORowRewardBuyUrl];
    }
    [aCoder encodeObject:@(self.rewardDeliverStatus) forKey:kWOORowRewardDeliverStatus];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.articleId = [aDecoder decodeObjectForKey:kWOORowArticleId];
    self.createDate = [[aDecoder decodeObjectForKey:kWOORowCreateDate] integerValue];
    self.orderId = [aDecoder decodeObjectForKey:kWOORowOrderId];
    self.orderStatus = [[aDecoder decodeObjectForKey:kWOORowOrderStatus] integerValue];
    self.payCoinAmount = [[aDecoder decodeObjectForKey:kWOORowPayCoinAmount] integerValue];
    self.priceAmount = [[aDecoder decodeObjectForKey:kWOORowPriceAmount] integerValue];
    self.productImage = [aDecoder decodeObjectForKey:kWOORowProductImage];
    self.productName = [aDecoder decodeObjectForKey:kWOORowProductName];
    self.rewardAmount = [[aDecoder decodeObjectForKey:kWOORowRewardAmount] integerValue];
    self.rewardBuyUrl = [aDecoder decodeObjectForKey:kWOORowRewardBuyUrl];
    self.rewardDeliverStatus = [[aDecoder decodeObjectForKey:kWOORowRewardDeliverStatus] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOORewardRow *copy = [WOORewardRow new];
    
    copy.articleId = [self.articleId copy];
    copy.createDate = self.createDate;
    copy.orderId = [self.orderId copy];
    copy.orderStatus = self.orderStatus;
    copy.payCoinAmount = self.payCoinAmount;
    copy.priceAmount = self.priceAmount;
    copy.productImage = [self.productImage copy];
    copy.productName = [self.productName copy];
    copy.rewardAmount = self.rewardAmount;
    copy.rewardBuyUrl = [self.rewardBuyUrl copy];
    copy.rewardDeliverStatus = self.rewardDeliverStatus;
    
    return copy;
}

- (WOOOrderStatusType)orderStatusType {
    if (_orderStatusType == WOOOrderStatusTypeDefault) {
        switch (self.orderStatus) {
            case -11:
                _orderStatusType = WOOOrderStatusTypeCancel;
                break;
            case 11:
                _orderStatusType = WOOOrderStatusTypePayed;
                break;
            case 21:
                _orderStatusType = WOOOrderStatusTypeSended;
                break;
            case 31:
                _orderStatusType = WOOOrderStatusTypeCompleted;
                break;
            default:
                break;
        }
    }
    return _orderStatusType;
}

- (WOORewardStatusType)rewardStatusType {
    switch (self.rewardDeliverStatus) {
        case 0:
            _rewardStatusType = WOORewardStatusTypeUndeliver;
            break;
        case 1:
            _rewardStatusType = WOORewardStatusTypeDeliver;
            break;
        default:
            break;
    }
    return _rewardStatusType;
}

@end
