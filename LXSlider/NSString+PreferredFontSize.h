//
//  NSString+PreferredFontSize.h
//  testAutoSizeFontInDrawRect
//
//  Created by linx on 16/4/5.
//  Copyright © 2016年 linx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (PreferredFontSize)

/**
 *  计算给定区域内, 尝试计算出最大能够容纳的字体(宽度优先), 返回区域的size, 和字体号(系统默认字体)
 *
 *  @param string        要显示的string
 *  @param maxSize       最大区域
 *  @param preferredSize 返回文字绘制区域
 *  @param preferredFont 返回文字字号(系统字体)
 */
+ (void)preferredFontSizeWithString:(NSString*)string maxSize:(CGSize)maxSize preferredFontSize:(CGSize*)preferredFontSize preferredFont:(CGFloat*)preferredFont;

@end
