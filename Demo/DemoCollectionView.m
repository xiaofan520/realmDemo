//
//  DemoCollectionView.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoCollectionView.h"

@interface DemoCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation DemoCollectionView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViews];
    }
    return self;
}

- (void) setUpSubViews {
    [self addSubview:self.collectionView];
}

#pragma mark 懒加载
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowlayout.minimumLineSpacing = 0;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

#pragma mark collection view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(demoCollectionView:numberForItemsOnSection:)]) {
        return [self.dataSource demoCollectionView:self numberForItemsOnSection:section];
    }
    @throw [NSException exceptionWithName:@"demo collection view data source" reason:@"demo collectionview data sourc 没有实现  " userInfo:nil];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(demoCollectionView:cellForItemAtIndexPath:)]) {
        return [self.dataSource demoCollectionView:self cellForItemAtIndexPath:indexPath];
    }
    @throw [NSException exceptionWithName:@"demo collection view data source" reason:@"demo collectionview data sourc 没有实现  " userInfo:nil];
}

#pragma mark collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(demoCollectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate demoCollectionView:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark 暴露方法实现  
- (void)registerDemoNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}

- (void)registerDemoClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (__kindof UICollectionViewCell *)dequeueReusableDemoCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}


@end
