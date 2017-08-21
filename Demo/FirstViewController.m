//
//  FirstViewController.m
//  RealmDemo
//
//  Created by fan on 16/7/8.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//

#import "FirstViewController.h"
#import "PersonModel.h"
#import "RealmTool.h"
#import <RLMRealm.h>
@interface FirstViewController ()
@property (nonatomic, strong) RLMNotificationToken *token;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

 
    [[RLMRealm defaultRealm] beginWriteTransaction];
    PersonModel *model = [[PersonModel alloc] init];
    model.myId = @"100";
    model.name = @"我是默认的";
    [[RLMRealm defaultRealm] addOrUpdateObject:model];
    [[RLMRealm defaultRealm] commitWriteTransaction];
    
    
    
    for (int i = 9; i<11; i++) {
        PersonModel *model= [[PersonModel alloc] init];
        model.myId = [NSString stringWithFormat:@"%d",i];
        model.name = [NSString stringWithFormat:@"名字%d",i+5];
        
        [[RealmTool DefaultRealmForUser] beginWriteTransaction];
        [[RealmTool DefaultRealmForUser] addOrUpdateObject:model];
        [[RealmTool DefaultRealmForUser] commitWriteTransaction];
    }
//
    
    
    self.token = [[RealmTool DefaultRealmForUser] addNotificationBlock:^(NSString *note, RLMRealm * realm) {
       
        RLMResults *models = [PersonModel allObjectsInRealm:[RealmTool DefaultRealmForUser]];
        NSLog(@"%@",models);
        
    }];
    UIButton*bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
    bt.frame = CGRectMake(100, 100, 50, 50);
    [bt setTitle:@"退出" forState:UIControlStateNormal];
    bt.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bt];
    
    UIButton*bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt1 addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    bt1.frame = CGRectMake(100, 150, 50, 50);
    [bt1 setTitle:@"查询" forState:UIControlStateNormal];
    bt1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bt1];
    
    UIButton*bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt2 addTarget:self action:@selector(chage) forControlEvents:UIControlEventTouchUpInside];
    bt2.frame = CGRectMake(100, 200, 50, 50);
    [bt2 setTitle:@"修改" forState:UIControlStateNormal];
    bt2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bt2];

}
-(void)search{

    RLMResults *models = [PersonModel allObjectsInRealm:[RealmTool DefaultRealmForUser]];
    NSLog(@"%@",models);
    
}

- (void)chage{
    [[RealmTool DefaultRealmForUser] beginWriteTransaction];

    RLMResults *models = [PersonModel objectsInRealm:[RealmTool DefaultRealmForUser] where:@"myId = '1'"];
    PersonModel *model = models[0];
    model.name = @"我修改了";
    
    [[RealmTool DefaultRealmForUser] addOrUpdateObject:model];
    [[RealmTool DefaultRealmForUser] commitWriteTransaction];

//    [[RealmTool DefaultRealmForUser] transactionWithBlock:^{
//       
//    }];
    
}

-(void)loginOut{

    [self.navigationController popViewControllerAnimated:YES];
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
