//
//  DemoSiftView.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoSiftView : UIView

@property (nonatomic, copy) void(^siftResult)(NSDictionary *result);

+ (instancetype) initAtY:(CGFloat)y dataSource:(NSArray *)dataSource;

- (void) setOriginData:(NSArray *)originData;

- (void) resetData;

- (void) hidden;

@end
