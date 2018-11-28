//
//  YHColor.m
//  CarVideo
//
//  Created by Ethan on 2018/8/4.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "YHColor.h"

@implementation YHColor
+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
}

+ (UIColor *)yh_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

+ (UIColor *)yh_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)baseViewColor {
    return [UIColor whiteColor];
}

+ (UIColor *)helpButtonColor {
    return [[self class] yh_colorWithRed:254 green:172 blue:116];
}

+ (UIColor *)topicViewColor {
    return [YHColor yh_colorWithRed:246 green:166 blue:34];
}
@end
