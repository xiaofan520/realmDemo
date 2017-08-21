//
//  DemoCollectionViewCell.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) void(^btnClicked)(void);

@end
