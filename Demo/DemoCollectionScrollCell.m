//
//  DemoCollectionScrollCell.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoCollectionScrollCell.h"
#import "DemoCollectionViewCell.h"
#import "DemoCollectionView.h"

@interface DemoCollectionScrollCell ()<DemoCollectionViewDelegate,DemoCollectionViewDataSource>

@property (nonatomic, strong) DemoCollectionView *collectionView;

@end

@implementation DemoCollectionScrollCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self subSubViews];
    }
    return self;
}

- (void) subSubViews {
    [self.contentView addSubview:self.collectionView];
}

#pragma mark 懒加载
- (DemoCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[DemoCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerDemoNib:[UINib nibWithNibName:NSStringFromClass([DemoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"DemoCollectionViewCell"];
    }
    return _collectionView;
}

#pragma mark demo collection view data source
- (NSInteger)demoCollectionView:(DemoCollectionView *)demoCollectionView numberForItemsOnSection:(NSInteger)section {
    
    return 3;
}

- (__kindof UICollectionViewCell *)demoCollectionView:(DemoCollectionView *)demoCollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [demoCollectionView dequeueReusableDemoCellWithReuseIdentifier:@"DemoCollectionViewCell" forIndexPath:indexPath];
    __weak typeof(self) weakSelf = self;
    ((DemoCollectionViewCell *)cell).btnClicked = ^(){
        if (weakSelf.btnClicked) {
            weakSelf.btnClicked();
        }
    };
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor blueColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor redColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor lightGrayColor];
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark demo collection view delegate
- (void)demoCollectionView:(DemoCollectionView *)demoCollectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--------%lu-------------",indexPath.row);
}




@end
