//
//  DemoViewModel.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DemoViewModel : NSObject

@property (nonatomic, assign) CGFloat viewheight;

@property (nonatomic, strong) NSMutableArray *dataSource;

- (NSDictionary *) getResult;

@end
