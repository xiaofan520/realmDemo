//
//  DemoCollectionView.h
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoCollectionView;

@protocol DemoCollectionViewDataSource <NSObject>

@required
- (NSInteger) demoCollectionView:(DemoCollectionView *)demoCollectionView numberForItemsOnSection:(NSInteger)section;

- (__kindof UICollectionViewCell *)demoCollectionView:(DemoCollectionView *)demoCollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol DemoCollectionViewDelegate <NSObject>

@optional
- (void) demoCollectionView:(DemoCollectionView *)demoCollectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface DemoCollectionView : UIView

@property (nonatomic, weak) id<DemoCollectionViewDataSource>dataSource;

@property (nonatomic, weak) id<DemoCollectionViewDelegate>delegate;

- (void)registerDemoClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

- (void)registerDemoNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (__kindof UICollectionViewCell *)dequeueReusableDemoCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;


@end
