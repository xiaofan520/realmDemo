//
//  DemoCollectionViewCell.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoCollectionViewCell.h"

@implementation DemoCollectionViewCell
- (IBAction)btnClicked:(id)sender {
    if (self.btnClicked) {
        self.btnClicked();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
