//
//  YHColor.h
//  CarVideo
//
//  Created by Ethan on 2018/8/4.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHColor : UIColor
+ (UIColor *)randomColor;

+ (UIColor *)yh_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)yh_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)baseViewColor;

+ (UIColor *)helpButtonColor;

+ (UIColor *)topicViewColor;
@end
