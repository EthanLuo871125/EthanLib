//
//  YHConnHelpTableViewCell.m
//  CarVideo
//
//  Created by Ethan.Luo on 2018/8/28.
//  Copyright © 2018年 Shanghai Yun Ye Shi Xun Technology Co. Ltd. All rights reserved.
//

#import "YHConnHelpTableViewCell.h"

@implementation YHConnHelpTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat gap = self.edgeOffset/2;
    self.imageView.bounds = CGRectMake(0,0,30,30);
    
    self.imageView.frame = CGRectMake(gap,0.5*(self.height-30),30,30);
    
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
    CGRect tmpFrame = self.textLabel.frame;
    
    tmpFrame.origin.x = self.imageView.right+10;
    
    self.textLabel.frame = tmpFrame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
