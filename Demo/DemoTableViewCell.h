//
//  DemoTableViewCell.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoSubModel.h"

@interface DemoTableViewCell : UITableViewCell

- (void) updataWithModel:(DemoSubModel *)model;

@end
