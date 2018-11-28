//
//  YHProblemCell.h
//  CarVideo
//
//  Created by Ethan.Luo on 2018/9/2.
//  Copyright © 2018年 Shanghai Yun Ye Shi Xun Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHProblemCell : UITableViewCell
@property (strong, nonatomic) UILabel *mainLabel;
@property (strong, nonatomic) UILabel *subLabel;

- (void)setMainText:(NSString *)text height:(CGFloat)height;
- (void)setSubText:(NSString *)text height:(CGFloat)height;
@end
