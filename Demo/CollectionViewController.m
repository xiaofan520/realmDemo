//
//  CollectionViewController.m
//  Demo
//
//  Created by fan on 17/3/19.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "CollectionViewController.h"
#import "DemoCollectionViewCell.h"
#import "DemoCollectionScrollCell.h"

#import "DemoAlertView.h"

typedef NS_ENUM(NSInteger, DemoShoTtype) {
    DemoShoTtypeWithOne = 0,
    DemoShoTtypeWithTow,
    DemoShoTtypeWithThree,
};

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) DemoAlertView *alertView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.collectionView];
//    
//    [self.view addSubview:self.alertView];
//    
//    self.alertView.resultData = ^(NSDictionary *result){
//        NSLog(@"%@",result);
//    };
}

- (DemoAlertView *)alertView {
    if (!_alertView) {
        _alertView = [[DemoAlertView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) dataSource:@[@"titleOne",@"titleTow",@"titleThree",@"titleFour"]];
    }
    return _alertView;
}

#pragma mark 懒加载 
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
       // flowlayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowlayout.minimumLineSpacing = 10;
        flowlayout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DemoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"DemoCollectionViewCell"];
        [_collectionView registerClass:[DemoCollectionScrollCell class] forCellWithReuseIdentifier:@"DemoCollectionScrollCell"];
    }
    return _collectionView;
}

#pragma mark colelction view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCollectionViewCell" forIndexPath:indexPath];
    switch (indexPath.section) {
        case DemoShoTtypeWithOne:
        {
            DemoCollectionScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCollectionScrollCell" forIndexPath:indexPath];
            cell.btnClicked = ^(){
                NSLog(@"btn clickec88  88888888888");
            };
            return cell;
        }
            break;
        case DemoShoTtypeWithTow:
        {
            cell.contentView.backgroundColor = [UIColor redColor];
        }
            break;
        case DemoShoTtypeWithThree:
        {
            cell.contentView.backgroundColor = [UIColor blueColor];
        }
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark collection view flow layout
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case DemoShoTtypeWithOne:
        {
            return CGSizeMake(self.view.frame.size.width - 10 * 2, 100);
        }
            break;
        case DemoShoTtypeWithTow:
        {
            return CGSizeMake((self.view.frame.size.width - 10 * 3) / 2, 100);
        }
            break;
        case DemoShoTtypeWithThree:
        {
            return CGSizeMake((self.view.frame.size.width - 10 * 4) / 3, 100);
        }
            break;
        default:
            break;
    }
    return CGSizeZero;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeZero;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    switch (section) {
        case DemoShoTtypeWithOne:
        {
            return 10;
        }
            break;
        case DemoShoTtypeWithTow:
        {
            return 10;
        }
            break;
        case DemoShoTtypeWithThree:
        {
            return 10;
        }
            break;
        default:
            break;
    }

    return 10;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
