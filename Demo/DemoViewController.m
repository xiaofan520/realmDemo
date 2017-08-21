//
//  DemoViewController.m
//  Demo
//
//  Created by fan on 17/6/18.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoViewController.h"
#import "ZJScrollPageView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 滚动条颜色
    style.scrollLineColor = [UIColor colorWithRed:45/255.0  green:45/255.0  blue:45/255.0 alpha:1];
    
    style.showLine = YES;
    // 设置标题之间的间距 大于某个值scrollTitle才会有效
    style.titleMargin = 30;
    style.scrollTitle = YES;

    //    // 右边附加按钮类似加号
    style.showExtraButton = YES;
    // 右边附加按钮背景图
    style.extraBtnBackgroundImageName = @")@2x";
    
    //    // 标题选中的颜色
    style.selectedTitleColor = [UIColor colorWithRed:45/255.0  green:45/255.0  blue:45/255.0 alpha:1];
    //    //显示滚动条
    style.showLine = YES;
    //    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    style.scaleTitle = YES;
    
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style childVcs:childVcs parentViewController:self];
    // 右边额外按钮的点击方法
    scrollPageView.extraBtnOnClick = ^(UIButton *bt){
        bt.backgroundColor = [UIColor redColor];
    };
    scrollPageView.bt.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scrollPageView];
    // Do any additional setup after loading the view.
}
#pragma mark -- 添加视图
- (NSArray *)setupChildVcAndTitle {
    
    FirstViewController *vc1 = [FirstViewController new];
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.title = @"资讯";
    
    SecondViewController *vc2 = [SecondViewController new];
    vc2.view.backgroundColor = [UIColor redColor];
    vc2.title = @"圈哦";
    
    ThirdViewController *vc3 = [ThirdViewController new];
    vc3.view.backgroundColor = [UIColor redColor];
    vc3.title = @"朋友";
    
    FourViewController *vc4 = [FourViewController new];
    vc4.view.backgroundColor = [UIColor redColor];
    vc4.title = @"球星";
    
    
    FiveViewController *vc5 = [FiveViewController new];
    vc5.view.backgroundColor = [UIColor redColor];
    vc5.title = @"体育";
    
    SixViewController *vc6 = [SixViewController new];
    vc6.view.backgroundColor = [UIColor blueColor];
    vc6.title = @"设备";
    
    NSArray *childVcs = [NSArray arrayWithObjects:vc1, vc2,vc3, vc4,vc5,vc6,nil];
    return childVcs;
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
