//
//  DemoTableViewCell.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updataWithModel:(DemoSubModel *)model {
    for (DemoSubSubModel *subModel in model.subDataSource) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = subModel.frame;
        [btn setTitle:subModel.title forState:UIControlStateNormal];
        
        
        [self.contentView addSubview:btn];
    }
}

@end
