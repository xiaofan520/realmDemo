//
//  DemoSiftView.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoSiftView.h"

#define  VIEW_HEIGHT 300

@interface DemoSiftView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) CGFloat startY;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSDictionary *resultDict;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation DemoSiftView

+ (instancetype)initAtY:(CGFloat)y dataSource:(NSArray *)dataSource {
    DemoSiftView *siftView = [[DemoSiftView alloc] initWithFrame:CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, 0)];
    siftView.dataSource = dataSource;
    siftView.startY = y;
    siftView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    [keywindow addSubview:siftView.bgView];
    
    [keywindow addSubview:siftView];
    [siftView show];
    return siftView;
}

#pragma mark 懒加载
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.startY,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.startY)];
        _bgView.backgroundColor= [[UIColor blackColor] colorWithAlphaComponent:0];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, 0) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void) show {
    if (self.siftResult) {
        self.siftResult(self.resultDict);
    }
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.frame = CGRectMake(0,self.startY, [UIScreen mainScreen].bounds.size.width, VIEW_HEIGHT);
        weakSelf.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
}

- (void) hidden {
    if (self.siftResult) {
        self.siftResult(self.resultDict);
    }
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.frame = CGRectMake(0,self.startY, [UIScreen mainScreen].bounds.size.width, 0);
        weakSelf.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        weakSelf.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
        [weakSelf.bgView removeFromSuperview];
    }];
}

#pragma mark 暴露
- (void)setOriginData:(NSArray *)originData {
    
}

- (void)resetData {

}

#pragma mark table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

#pragma mark table view delegate


@end
