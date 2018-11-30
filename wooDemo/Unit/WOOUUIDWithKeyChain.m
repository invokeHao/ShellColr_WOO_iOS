//
//  WOOUUIDWithKeyChain.m
//  wooDemo
//
//  Created by colr on 2018/11/21.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOUUIDWithKeyChain.h"


@implementation WOOUUIDWithKeyChain

+ (NSString *)getUUID {
    NSString * strUUID = (NSString *)[KeyChainStore load:KUserUUIDKeyChainKey];

    if ([strUUID isEqualToString:@""] || !strUUID){
        //生成15位随机数
        NSString * resultStr = @"";
        for (int i = 0; i < 15; i++) {
            int x = arc4random() % 10;
            resultStr = FORMAT(@"%@%d",resultStr,x);
        }
        [KeyChainStore save:KUserUUIDKeyChainKey data:resultStr];
        return resultStr;
    }
    return strUUID;
}


//+ (NSString *)getUUID {
//    //    [KeyChainStore deleteKeyData:KUserUUIDKeyChainKey];
//    NSString * strUUID = (NSString *)[KeyChainStore load:KUserUUIDKeyChainKey];
//
//    if ([strUUID isEqualToString:@""] || !strUUID){
//        CFUUIDRef puuid = CFUUIDCreate(nil);
//        CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
//        strUUID = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
//        NSMutableString *tmpResult = strUUID.mutableCopy;
//        // 去除“-”
//        NSRange range = [tmpResult rangeOfString:@"-"];
//        while (range.location != NSNotFound) {
//            [tmpResult deleteCharactersInRange:range];
//            range = [tmpResult rangeOfString:@"-"];
//        }
//        [KeyChainStore save:KUserUUIDKeyChainKey data:tmpResult];
//        return tmpResult;
//    }
//
//    return strUUID;
//}


@end


@implementation KeyChainStore

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)deleteKeyData:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end

