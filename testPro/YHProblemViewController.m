//
//  YHProblemViewController.m
//  CarVideo
//
//  Created by Ethan.Luo on 2018/9/2.
//  Copyright © 2018年 Shanghai Yun Ye Shi Xun Technology Co. Ltd. All rights reserved.
//

#import "YHProblemViewController.h"
#import "YHProblemCell.h"
@interface YHProblemViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *contentArray;
@property (strong, nonatomic) NSMutableArray *cellHeightArray;
@end

@implementation YHProblemViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.title = YYLOCALIZATION(@"常见问题");
    UIButton *customButton = [self createCustomButon:@"btn_menuback_n" hightImage:@"btn_menuback_pre"];
    [customButton addTarget:self action:@selector(viewLeftbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    
    self.contentArray = @[@[YYLOCALIZATION(@"1.APP如何连接到记录仪?"),
                            YYLOCALIZATION(@"答:先在手机wifi设置中连接上记录的wifi信号,再打开APP即可.")],
                          @[YYLOCALIZATION(@"2.看视频，下载图片等是否会耗手机流量?"),
                            YYLOCALIZATION(@"答:不会.记录仪与手机点对点连接,不耗手机流量.")],
                          @[YYLOCALIZATION(@"3.安卓或苹果手机连接上记录仪后,还可以上网吗?"),
                            YYLOCALIZATION(@"答:安卓手机不可以,必须断开与记录仪的wifi连接,才可以上网.苹果手机无此限制,连接到记录仪的wifi,也可以正常上网.")],
                          @[YYLOCALIZATION(@"4.记录仪的wifi密码是多少?忘记密码怎么办?"),
                            YYLOCALIZATION(@"答:默认密码是\"123456789\".忘记密码后,可用一个尖针长按复位键3秒,机器重启后,即可恢复默认密码.")]];
    self.cellHeightArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.contentArray.count; i++) {
        NSArray *arr = self.contentArray[i];
        CGFloat mainHeight = [self yh_getHeightWithFontSize:16 width:self.view.width-36 str:arr.firstObject];
        CGFloat subHeight = [self yh_getHeightWithFontSize:16 width:self.view.width-36 str:arr.lastObject];
        
        NSArray *heiArr = @[@(mainHeight), @(subHeight)];
        
        [self.cellHeightArray addObject:heiArr];
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
    NSArray *arr = self.cellHeightArray[indexPath.row];
    CGFloat h1 = [arr.firstObject doubleValue];
    CGFloat h2 = [arr.lastObject doubleValue];
    return h1 + h2 + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"YHConnHelpViewControllerCell";
    YHProblemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[YHProblemCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    else {
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *textArray = self.contentArray[indexPath.row];
    NSArray *heightArray = self.cellHeightArray[indexPath.row];
    [cell setMainText:textArray.firstObject height:[heightArray.firstObject doubleValue]];
    [cell setSubText:textArray.lastObject height:[heightArray.lastObject doubleValue]];
    
//    switch (indexPath.row) {
//        case 0:
//            cell.mainLabel.text = YYLOCALIZATION(@"1.APP如何连接到记录仪?");
//            cell.subLabel.text = YYLOCALIZATION(@"答:先在手机wifi设置中连接上记录的wifi信号,再打开APP即可.");
//            break;
//        case 1:
//            cell.mainLabel.text = YYLOCALIZATION(@"2.看视频，下载图片等是否会耗手机流量?");
//            cell.subLabel.text = YYLOCALIZATION(@"答:不会.记录仪与手机点对点连接,不耗手机流量.");
//            break;
//        case 2:
//            cell.mainLabel.text = YYLOCALIZATION(@"3.安卓或苹果手机连接上记录仪后,还可以上网吗?");
//            cell.subLabel.text = YYLOCALIZATION(@"答:安卓手机不可以,必须断开与记录仪的wifi连接,才可以上网.苹果手机无此限制,连接到记录仪的wifi,也可以正常上网.");
//            break;
//        case 3:
//            cell.mainLabel.text = YYLOCALIZATION(@"4.记录仪的wifi密码是多少?忘记密码怎么办?");
//            cell.subLabel.text = YYLOCALIZATION(@"答:默认密码是\"123456789\".忘记密码后,可用一个尖针长按复位键3秒,机器重启后,即可恢复默认密码.");
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
    
    [cell.imageView addSubview:titleLabel];
    cell.imageView.image = [UIImage imageNamed:@"alpha0"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
