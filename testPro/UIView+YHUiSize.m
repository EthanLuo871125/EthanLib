//
//  UIView+YHUiSize.m
//  CarVideo
//
//  Created by Ethan on 2018/8/5.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "UIView+YHUiSize.h"

@implementation UIView (YHUiSize)
- (CGFloat)statueBarHeight {
    return KIsiPhoneX ? 44.0f : 20.0f;
}

- (CGFloat)navBarHeight {
    CGFloat statueheight = KIsiPhoneX ? 44.0f : 20.0f;
    return statueheight+44;
}

- (CGFloat)tabBarHeight {
    CGFloat offsetHeight = KIsiPhoneX ? 34.0f : 0.0f;
    return 49.0+offsetHeight;
}

- (CGFloat)edgeOffset {
    return 0;//*[UIScreen mainScreen].scale;
}

- (CGFloat)topOffset {
    return 20;
}

- (void)setTop:(CGFloat)t {
    self.frame = CGRectMake(self.left, t, self.width, self.height);
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setBottom:(CGFloat)b {
    self.frame = CGRectMake(self.left, b - self.height, self.width, self.height);
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLeft:(CGFloat)l {
    self.frame = CGRectMake(l, self.top, self.width, self.height);
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)r {
    self.frame = CGRectMake(r - self.width, self.top, self.width, self.height);
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWidth:(CGFloat)w {
    self.frame = CGRectMake(self.left, self.top, w, self.height);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)h {
    self.frame = CGRectMake(self.left, self.top, self.width, h);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    self.frame = CGRectMake(self.left, self.top, size.width, size.height);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

- (CGFloat)tx {
    return self.transform.tx;
}

- (void)setTx:(CGFloat)tx {
    CGAffineTransform transform = self.transform;
    transform.tx = tx;
    self.transform = transform;
}

- (CGFloat)ty {
    return self.transform.ty;
}

- (void)setTy:(CGFloat)ty {
    CGAffineTransform transform = self.transform;
    transform.ty = ty;
    self.transform = transform;
}

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen {
    if (self == nil) {
        return NO;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return NO;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    UIWindow *win= [UIApplication sharedApplication].keyWindow;
    CGRect rect = [self.superview convertRect:self.frame toView:win];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  NO;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}
@end
