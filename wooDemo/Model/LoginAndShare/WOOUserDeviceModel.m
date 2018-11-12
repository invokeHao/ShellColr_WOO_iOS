//
//  WOOUserDeviceModel.m
//  wooDemo
//
//  Created by colr on 2018/10/31.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOUserDeviceModel.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <sys/sysctl.h>
#import <sys/ioctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <CommonCrypto/CommonDigest.h>
#import "OpenUDID.h"

@implementation WOOUserDeviceModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configTheData];
    }
    return self;
}

- (void)configTheData {
    self.resolution = [self getScreenPix];
    self.os = @"Ios";
    self.os_api = @"11";
    self.carrier = [self getDeviceNetName];
    self.os_version = [self getDeviceSystemVersion];
    self.mc = [self getMacAddress];
    self.device_brand = @"Apple";
    self.device_model = [WOODevice iphoneType];
    self.language = [self getLocalLanguage];
    self.timezone = [self getTimezone];
    self.udid = [self getUUID];
    self.Openuuid = [OpenUDID value];
    NSString * hashStr = @"";
    if (self.resolution.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"resolution:%@,",self.resolution)];
    }
    if (self.os) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"os:%@,",self.os)];
    }
    if (self.carrier.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"carrier:%@,",self.carrier)];
    }
    if (self.os_version.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"os_version:%@,",self.os_version)];
    }
    if (self.mc.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"mc:%@,",self.mc)];
    }
    if (self.device_brand.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"device_brand:%@,",self.device_brand)];
    }
    if (self.device_model.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"device_model:%@,",self.device_model)];
    }
    if (self.language.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"language:%@,",self.language)];
    }
    if (self.timezone.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"timezone:%@,",self.timezone)];
    }
    if (self.udid.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"udid:%@,",self.udid)];
    }
    if (self.Openuuid.length > 0) {
        hashStr = [hashStr stringByAppendingString:FORMAT(@"Openuuid:%@,",self.Openuuid)];
    }
    NSString * salt = @"ca1344b92801137aef458beb25248edd";
    hashStr = [hashStr stringByAppendingString:FORMAT(@"SALT:%@",salt)];
    
    hashStr = [self md5:hashStr];
    self.sig_hash = hashStr;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if (self.resolution.length > 0) {
        [dic setObject:self.resolution forKey:@"resolution"];
    }
    if (self.display_density.length > 0) {
        [dic setObject:self.display_density forKey:@"display_density"];
    }
    if (self.carrier.length > 0) {
        [dic setObject:self.carrier forKey:@"carrier"];
    }
    if (self.os) {
        [dic setObject:self.os forKey:@"os"];
    }
    if (self.os_api) {
        [dic setObject:self.os_api forKey:@"os_api"];
    }
    if (self.os_version.length > 0) {
        [dic setObject:self.os_version forKey:@"os_version"];
    }
    if (self.mc.length > 0) {
        [dic setObject:self.mc forKey:@"mc"];
    }
    if (self.device_brand.length > 0) {
        [dic setObject:self.device_brand forKey:@"device_brand"];
    }
    if (self.device_model.length > 0) {
        [dic setObject:self.device_model forKey:@"device_model"];
    }
    if (self.timezone.length > 0) {
        [dic setObject:self.timezone forKey:@"timezone"];
    }
    if (self.language.length > 0) {
        [dic setObject:self.language forKey:@"language"];
    }
    if (self.udid.length > 0) {
        [dic setObject:self.udid forKey:@"udid"];
    }
    if (self.sig_hash.length > 0) {
        [dic setObject:self.sig_hash forKey:@"sig_hash"];
    }
    if (self.Openuuid.length > 0) {
        [dic setObject:self.Openuuid forKey:@"Openuuid"];
    }
    return [dic copy];
}

- (NSDictionary *)streamListDictionary {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if (self.udid.length > 0) {
        [dic setObject:self.udid forKey:@"udid"];
    }
    if (self.Openuuid.length > 0) {
        [dic setObject:self.Openuuid forKey:@"Openuuid"];
    }
    self.device_id = @"7564326355";
    self.app_name = @"WOO";
    self.version_code = @"100";
    [dic setObject:self.device_id forKey:@"device_id"];
    [dic setObject:self.app_name forKey:@"app_name"];
    [dic setObject:self.version_code forKey:@"version_code"];
    return [dic copy];
}

- (NSString *)getScreenPix{
    NSString *screenPix = @"";
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    //分辨率
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    screenPix = [NSString stringWithFormat:@"%.0fx%.0f",width*scale_screen,height*scale_screen];
    return screenPix;
}

- (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    NSMutableString *tmpResult = result.mutableCopy;
    // 去除“-”
    NSRange range = [tmpResult rangeOfString:@"-"];
    while (range.location != NSNotFound) {
        [tmpResult deleteCharactersInRange:range];
        range = [tmpResult rangeOfString:@"-"];
    }
    return tmpResult;
}

- (NSString*)getDeviceSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}



#pragma mark - 获取运行商的名称

- (NSString*)getDeviceNetName{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return [NSString stringWithFormat:@"%@",[carrier carrierName]];
}

#pragma mark - 获取设备MAC地址

- (NSString *)getMacAddress {
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. Rrror!\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

#pragma mark- 获取本地语言
- (NSString *)getLocalLanguage {
    NSString *language = [[[NSUserDefaults standardUserDefaults]
                           objectForKey:@"AppleLanguages"]
                          objectAtIndex:0];
    return language;
}

#pragma mark- 获取时区
-(NSString *)getTimezone
{
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSString *strZoneAbbreviation = [localZone abbreviation];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    strZoneAbbreviation = [regularExpression stringByReplacingMatchesInString:strZoneAbbreviation options:0 range:NSMakeRange(0, strZoneAbbreviation.length) withTemplate:@""];
    return strZoneAbbreviation;
}

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
