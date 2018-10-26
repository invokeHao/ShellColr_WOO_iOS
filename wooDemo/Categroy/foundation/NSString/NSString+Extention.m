//
//  NSString+extention.m
//  Yizhenapp
//
//  Created by augbase on 16/5/14.
//  Copyright © 2016年 wang. All rights reserved.
//
#import<CommonCrypto/CommonDigest.h>
#import "NSString+Extention.h"

@implementation NSString (extention)
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(CGSize)sizeWithWordWrapFont:(UIFont *)font maxSize:(CGSize)maxSize{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading  attributes:attrs context:nil].size;
}

//sha1加密方式
+ (NSString *)sha1:(NSString *)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

//字典转json字符串

+ (NSString*)dictionaryToJson:(NSDictionary *)dic {
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+(id)toArrayOrNSDictionary:(NSString*)NOjsonString

{
    
    if(NOjsonString.length==0) {
        
        return nil;
        
    }
    
    NSError*error =nil;
    
    NSData*StatusData = [NOjsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:StatusData
                     
                                                    options:NSJSONReadingAllowFragments
                     
                                                      error:&error];
    if(jsonObject !=nil&& error ==nil){
        
        return jsonObject;
        
    }else{
        //解析错误
        return nil;
    }
}

+(NSMutableString*)getTheMutableStringWithInteger:(NSInteger)num{
    //货币本地化
    NSString * string = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithInteger:num]
                                                         numberStyle:NSNumberFormatterDecimalStyle];
    return string;

}

+ (NSString *)getTheUnitStringWithInteger:(NSInteger)num {
    //带单位的string
    if (num < 10000) {
        return [NSString stringWithFormat:@"%ld", num];
    }else if (num < 100000000){
        return [NSString stringWithFormat:@"%.1fW+",(CGFloat)num/10000.0];
    }else{
        return [NSString stringWithFormat:@"%.1fE+",(CGFloat)num/100000000.0];
    }
}

+ (NSString *)deleteSpecificUrlQuery:(NSArray *)array andUrl:(NSString *)url {
    NSMutableDictionary *query = [[NSString dictionaryWithUrlString:url] mutableCopy];
    if (query) {
        [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([query objectForKey:obj]) {
                [query removeObjectForKey:obj];
            }
        }];
        NSArray *array = [url componentsSeparatedByString:@"?"];
        NSString *path = array.firstObject;
        NSString *queryString = [NSString keyValueStringWithDict:query.copy];
        if (queryString) {
            url = [NSString stringWithFormat:@"%@%@",path,queryString];
        }else {
            url = path;
        }
    }
    return url;
}

#pragma mark - private method

+ (NSString *)keyValueStringWithDict:(NSDictionary *)dict {
    if (dict == nil || dict.allKeys.count == 0) {
        return nil;
    }
    NSMutableString *string = [NSMutableString stringWithString:@"?"];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"%@=%@&",key,obj];
    }];
    
    if ([string rangeOfString:@"&"].length) {
        [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
    }
    return string;
}

+ (NSDictionary *)dictionaryWithUrlString:(NSString *)urlStr {
    if (urlStr && urlStr.length && [urlStr rangeOfString:@"?"].length == 1) {
        NSArray *array = [urlStr componentsSeparatedByString:@"?"];
        if (array && array.count == 2) {
            NSString *paramsStr = array[1];
            if (paramsStr.length) {
                NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
                NSArray *paramArray = [paramsStr componentsSeparatedByString:@"&"];
                for (NSString *param in paramArray) {
                    if (param && param.length) {
                        NSArray *parArr = [param componentsSeparatedByString:@"="];
                        if (parArr.count == 2) {
                            [paramsDict setObject:parArr[1] forKey:parArr[0]];
                        }
                    }
                }
                return paramsDict;
            }else{
                return nil;
            }
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

@end
