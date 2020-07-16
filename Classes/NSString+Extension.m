//
//  NSString+Extension.m
//  BusinessTribe
//
//  Created by Weidong Meng on 2020/6/13.
//  Copyright © 2020 mwd. All rights reserved.
//

#import "NSString+Extension.h"



@implementation NSString (Extension)
- (BOOL)isNotBlank {
    if ([self isKindOfClass:[NSNull class]] || self == nil) {
        return NO;
    }
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isPhoneNum{
    
    NSString *phone = @"^(1\\d{10})$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phone];
    return [predicate evaluateWithObject:self];
    
}

- (BOOL)containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}
/**
 密码检验规则
 */
- (BOOL)isCorrectPassword{
    NSString *passWordRegex = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [pred evaluateWithObject:self];
}

/**
 是否为大写字母
 */
- (BOOL)isCapital{
    if ([self isNotBlank]) {
        NSString *regex =@"[a-zA-Z]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [pred evaluateWithObject:self];
    }
    return NO;
}

/// 纯数字
- (BOOL)validNumber:(NSString *)str
{
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(str.length > 0) return NO;
    
    return YES;
}


/// 检测字符串是否包含中文
- ( BOOL)validContainChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

- (NSString *)get_UUID {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *) uuid;
}

- (NSString *)get_systemVersion {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

- (CGFloat)heightWithFont:(NSInteger)font width:(CGFloat)w {
    return [self boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:font] } context:nil].size.height;
}
- (CGFloat)heightWithFont:(NSInteger)font width:(CGFloat)w lineSpace:(CGFloat)space {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    return [self boundingRectWithSize:CGSizeMake(w,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],NSParagraphStyleAttributeName:style} context:nil].size.height;
}
- (CGFloat)widthWithFont:(NSInteger)font h:(CGFloat)h {
    return [self boundingRectWithSize:CGSizeMake(0, h) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName] context:nil].size.width;
}

@end
