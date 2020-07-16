//
//  NSString+Extension.h
//  BusinessTribe
//
//  Created by Weidong Meng on 2020/6/13.
//  Copyright © 2020 mwd. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
- (BOOL)isNotBlank;


/**
 是否为手机号码
 */
- (BOOL)isPhoneNum;


/**
是否包含某个字符串
 */
- (BOOL)containsString:(NSString *)string;

/**
 密码检验规则
 */
- (BOOL)isCorrectPassword;

/**
 是否为大写字母
 */
- (BOOL)isCapital;


/// 纯数字
- (BOOL)validNumber:(NSString *)str;


/// 检测字符串是否包含中文
- ( BOOL)validContainChinese:(NSString *)str;

/**
 获取UUID
 */
- (NSString *)get_UUID;
/**
 获取版本号
 */
- (NSString *)get_systemVersion;

/**
 获取height
 */
- (CGFloat)heightWithFont:(NSInteger)font width:(CGFloat)w;
/**
 获取height
 @param font font
 @param w width
 @param space space
 @return height
 */
- (CGFloat)heightWithFont:(NSInteger)font width:(CGFloat)w lineSpace:(CGFloat)space;
/**
 width
 @param font font description
 @param h h description
 @return return value description
 */
- (CGFloat)widthWithFont:(NSInteger)font h:(CGFloat)h;

@end

NS_ASSUME_NONNULL_END
