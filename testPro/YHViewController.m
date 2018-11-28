//
//  YHViewController.m
//  CarVideo
//
//  Created by Ethan on 2018/8/4.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "YHViewController.h"

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.translucent = NO;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.view.backgroundColor = [YHColor baseViewColor];
    // app从后台进入前台都会调用这个方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    // 添加检测app进入后台的观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewDidEnterBackground) name: UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)viewWillEnterForeground {
    
}

- (void)viewDidEnterBackground {
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.view) {
        [self setExclusiveTouchForButtons:self.view];
    }
}

- (void)setExclusiveTouchForButtons:(UIView *)myView {
    for (UIView * v in [myView subviews]) {
        if([v isKindOfClass:[UIButton class]])
            [((UIButton *)v) setExclusiveTouch:YES];
        else if ([v isKindOfClass:[UIView class]]){
            [self setExclusiveTouchForButtons:v];
        }
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}
- (BOOL)shouldAutorotate{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
