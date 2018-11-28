//
//  YHProblemCell.m
//  CarVideo
//
//  Created by Ethan.Luo on 2018/9/2.
//  Copyright © 2018年 Shanghai Yun Ye Shi Xun Technology Co. Ltd. All rights reserved.
//

#import "YHProblemCell.h"

@implementation YHProblemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (UILabel *)mainLabel {
    if (!_mainLabel) {
        _mainLabel = [[UILabel alloc] init];
        _mainLabel.numberOfLines = 0;
        _mainLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        _mainLabel.textAlignment = NSTextAlignmentLeft;
        [_mainLabel setFont:[UIFont systemFontOfSize:14]];
        
        _mainLabel.frame = CGRectMake(36, 0, self.width-28-8, 24);
        [self.contentView addSubview:_mainLabel];
    }
    
    return _mainLabel;
}

- (UILabel *)subLabel {
    if (!_subLabel) {
        _subLabel = [[UILabel alloc] init];
        _subLabel.numberOfLines = 0;
        _subLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subLabel.textAlignment = NSTextAlignmentLeft;
        [_subLabel setFont:[UIFont systemFontOfSize:14]];
//        _subLabel.backgroundColor = [YHColor yellowColor];
        _subLabel.frame = CGRectMake(36, self.mainLabel.bottom+2, self.mainLabel.width, self.height - self.mainLabel.height-2);
        [self.contentView addSubview:_subLabel];
    }
    
    return _subLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat gap = self.edgeOffset/2;
    self.imageView.bounds = CGRectMake(0,0,28,28);
    self.imageView.frame = CGRectMake(gap,0,28,28);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
//    self.mainLabel.frame = CGRectMake(self.imageView.right+ 8, 0, self.width-28-8, 24);
//
//    self.subLabel.frame = CGRectMake(self.mainLabel.left, self.mainLabel.bottom+2, self.mainLabel.width, self.height - self.mainLabel.height-2);
    
    self.mainLabel.width = self.width - 36;
    self.subLabel.width = self.width - 36;
    
    UIView *view = [self.subLabel viewWithTag:200];
    if (view) {
        [view removeFromSuperview];
    }
    
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, self.subLabel.height-1, self.subLabel.width, 1)];
    sep.tag = 200;
    sep.backgroundColor = [UIColor lightGrayColor];
    [self.subLabel addSubview:sep];
}

- (void)setMainText:(NSString *)text height:(CGFloat)height {
    self.mainLabel.text = text;
    self.mainLabel.height = height;
    self.mainLabel.top = 0;
}
- (void)setSubText:(NSString *)text height:(CGFloat)height {
    self.subLabel.text = text;
    self.subLabel.height = height;
    self.subLabel.top = self.mainLabel.bottom + 2;
    
    [self setNeedsLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
