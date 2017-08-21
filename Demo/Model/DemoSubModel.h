//
//  DemoSubModel.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoSubSubModel.h"
#import <UIKit/UIKit.h>

@interface DemoSubModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, strong) NSMutableArray *subDataSource;

- (NSDictionary *) getResult;

- (void) selectItemWithModel:(DemoSubSubModel *)model;

@end
