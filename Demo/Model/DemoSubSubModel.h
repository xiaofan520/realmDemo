//
//  DemoSubSubModel.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DemoSubSubModel : NSObject

@property (nonatomic, assign) CGRect frame;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign, getter=isSelect) BOOL select;

@end
