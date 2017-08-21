//
//  DemoAlertView.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoAlertView.h"
#import "DemoSiftView.h"

#define START_TAG 1000

@interface DemoAlertView ()

@property (nonatomic, strong) UIButton *currentBtn;

@property (nonatomic, strong) DemoSiftView *siftView;


@end

@implementation DemoAlertView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource {
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViewsWithDataSource:dataSource];
    }
    return self;
}

- (void) setUpSubViewsWithDataSource:(NSArray *)dataSource {
    CGFloat width = self.frame.size.width / dataSource.count;
    CGFloat height = self.frame.size.height - 0.5;
    CGFloat currentX = 0;
    NSInteger index = 0;
    for (NSString *title in dataSource) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(currentX, 0, width, height);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (index == 0) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.currentBtn = button;
        }
        button.tag = START_TAG + index;
        [self addSubview:button];
        currentX += width;
        index ++;
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:lineView];
}

- (void)btnClicked:(UIButton *)sender {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            if ([view isEqual:sender]) {
                [((UIButton *)view) setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

            }else {
                [((UIButton *)view) setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
    }
    __weak typeof(self) weakSelf = self;
    if ([self.currentBtn isEqual:sender]) {
        if (!self.siftView) {
            self.siftView = [DemoSiftView initAtY:self.frame.origin.y + self.frame.size.height dataSource:self.siftDataSource];
            self.siftView.siftResult = ^(NSDictionary *result){
                weakSelf.siftView = nil;
            };
        }else {
            [self.siftView hidden];
        }
    }else {
        if (self.siftView) {
            [self.siftView hidden];
            self.siftView = [DemoSiftView initAtY:self.frame.origin.y + self.frame.size.height dataSource:self.siftDataSource];
            self.siftView.siftResult = ^(NSDictionary *result){
                weakSelf.siftView = nil;
            };
        }else {
            self.siftView = [DemoSiftView initAtY:self.frame.origin.y + self.frame.size.height dataSource:self.siftDataSource];
            self.siftView.siftResult = ^(NSDictionary *result){
                weakSelf.siftView = nil;
            };
        }
    }
    
    self.currentBtn = sender;
    
}

#pragma mark 懒加载

- (void)hiddenAll {
    [self.siftView hidden];
}



@end
