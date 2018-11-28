//
//  UIView+YHUiSize.h
//  CarVideo
//
//  Created by Ethan on 2018/8/5.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface UIView (YHUiSize)
@property (nonatomic, assign, readonly) CGFloat statueBarHeight;
@property (nonatomic, assign, readonly) CGFloat edgeOffset;
@property (nonatomic, assign, readonly) CGFloat topOffset;

@property (nonatomic, assign, readonly) CGFloat navBarHeight;
@property (nonatomic, assign, readonly) CGFloat tabBarHeight;

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat tx;

@property (nonatomic, assign) CGFloat ty;

- (BOOL)isDisplayedInScreen;
@end
