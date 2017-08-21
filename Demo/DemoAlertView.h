//
//  DemoAlertView.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoAlertView : UIView

@property (nonatomic, copy) void(^resultData)(NSDictionary *result);

@property (nonatomic, strong) NSArray *siftDataSource;

- (instancetype) initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource;

- (void) hiddenAll;


@end
