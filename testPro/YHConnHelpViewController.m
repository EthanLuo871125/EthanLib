//
//  YHConnHelpViewController.m
//  CarVideo
//
//  Created by Ethan.Luo on 2018/8/28.
//  Copyright © 2018年 Shanghai Yun Ye Shi Xun Technology Co. Ltd. All rights reserved.
//

#import "YHConnHelpViewController.h"

@interface YHConnHelpViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *contentArray;
@property (strong, nonatomic) NSMutableArray *cellHeightArray;
@end

@implementation YHConnHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;

    self.title = YYLOCALIZATION(@"连接帮助");
    UIButton *customButton = [self createCustomButon:@"btn_menuback_n" hightImage:@"btn_menuback_pre"];
    [customButton addTarget:self action:@selector(viewLeftbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    
    self.contentArray = @[YYLOCALIZATION(@"请确保电源线连接行车记录仪"),
                          YYLOCALIZATION(@"接通电源后,指示灯亮,等待指示灯开始闪烁或听到开机提示音,记录仪启动完成"),
                          YYLOCALIZATION(@"打开手机Wifi设置,选择连接记录仪的Wifi信号(ZhiNan_xxx,xxx为数字,每台机器都不同),默认密码为:123456789"),
                          YYLOCALIZATION(@"待wifi显示连接成功后,打开APP即可开始操作记录仪")];
    self.cellHeightArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.contentArray.count; i++) {
        CGFloat height = [self yh_getHeightWithFontSize:16 width:self.view.width-40 str:self.contentArray[i]];
        [self.cellHeightArray addObject:[NSNumber numberWithDouble:height]];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   self.view.width,
                                                                   self.view.height-self.view.tabBarHeight)
                                                  style:UITableViewStyleGrouped];
    self.tableView.tag = 1000;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0.1)];
//    self.tableView.backgroundColor = [YHColor yh_colorWithRed:248 green:248 blue:248];
    [self.view addSubview:self.tableView];
}

- (CGFloat)yh_getHeightWithFontSize:(CGFloat)fontSize width:(CGFloat)width str:(NSString *)str {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};//指定字号
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}

- (void)viewLeftbuttonAction:(UIButton *)leftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)createCustomButon:(NSString *)normalImage hightImage:(NSString *)hightImage {
    UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    
    return customButton;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat sumHeight = 0;
//    for (NSNumber *heiNum in self.cellHeightArray) {
//        sumHeight += heiNum.doubleValue;
//    }
    
    NSNumber *heiNum = self.cellHeightArray[indexPath.row];
    return heiNum.doubleValue + 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"YHConnHelpViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = self.contentArray[indexPath.row];
//    switch (indexPath.row) {
//        case 0:
//            cell.textLabel.text = YYLOCALIZATION(@"请确保电源线连接行车记录仪");
//            break;
//        case 1:
//            cell.textLabel.text = YYLOCALIZATION(@"接通电源后,指示灯亮,等待指示灯开始闪烁或听到开机提示音,记录仪启动完成");
//            break;
//        case 2:
//            cell.textLabel.text = YYLOCALIZATION(@"打开手机Wifi设置,选择连接记录仪的Wifi信号(ZhiNan_xxx,xxx为数字,每台机器都不同),默认密码为:123456789");
//            break;
//        case 3:
//            cell.textLabel.text = YYLOCALIZATION(@"待wifi显示连接成功后,打开APP即可开始操作记录仪");
//            break;
//
//        default:
//            break;
//    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    titleLabel.layer.masksToBounds = YES;
    titleLabel.layer.cornerRadius = 15;
    titleLabel.backgroundColor = [YHColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row+1];
    
//    titleLabel.frame = cell.imageView.frame;
//    [cell addSubview:titleLabel];
    
    [cell.imageView addSubview:titleLabel];
    cell.imageView.image = [UIImage imageNamed:@"alpha0"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
