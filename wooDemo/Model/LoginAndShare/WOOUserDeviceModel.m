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
    self.carrier = [self getDeviceNetName];
    self.os_version = [self getDeviceSystemVersion];
    self.mc = [self getMacAddress];
    self.device_brand = @"Apple";
    self.device_model = [WOODevice iphoneType];
    self.language = [self getLocalLanguage];
    self.timezone = [self getTimezone];
    self.udid = [self getUUID];
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if (self.resolution) {
        [dic setObject:self.resolution forKey:@"resolution"];
    }
    if (self.display_density) {
        [dic setObject:self.display_density forKey:@"display_density"];
    }
    if (self.carrier) {
        [dic setObject:self.carrier forKey:@"carrier"];
    }
    if (self.os) {
        [dic setObject:self.os forKey:@"os"];
    }
    if (self.mc) {
        [dic setObject:self.mc forKey:@"mc"];
    }
    if (self.device_brand) {
        [dic setObject:self.device_brand forKey:@"device_brand"];
    }
    if (self.device_model) {
        [dic setObject:self.device_model forKey:@"device_model"];
    }
    if (self.timezone) {
        [dic setObject:self.timezone forKey:@"timezone"];
    }
    if (self.language) {
        [dic setObject:self.language forKey:@"language"];
    }
    if (self.udid) {
        [dic setObject:self.udid forKey:@"udid"];
    }
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

@end
