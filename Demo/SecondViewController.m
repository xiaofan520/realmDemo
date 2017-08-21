//
//  SecondViewController.m
//  RealmDemo
//
//  Created by fan on 16/7/8.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//

#import "SecondViewController.h"
#import "PersonModel.h"
#import "RealmTool.h"
@interface SecondViewController ()
@property (nonatomic, strong) RLMNotificationToken *token;

@end

@implementation SecondViewController


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"22222222");
    self.token = [[RealmTool DefaultRealmForUser] addNotificationBlock:^(NSString *note, RLMRealm * realm) {
        
        RLMResults *models = [PersonModel allObjectsInRealm:[RealmTool DefaultRealmForUser]];
        NSLog(@"%@",models);
        
    }];

}
- (void)setDefaultRealmForUser:(NSString *)username {
    
    
//    
//    
//    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
//    // 使用默认的目录，但是使用用户名来替换默认的文件名
//    // 使用默认的目录，但是使用用户名来替换默认的文件名
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docDir = [paths objectAtIndex:0];
//    config.inMemoryIdentifier = docDir;
//    config.inMemoryIdentifier = [[[config.inMemoryIdentifier stringByDeletingLastPathComponent]
//                                  stringByAppendingPathComponent:username]
//                                 stringByAppendingPathExtension:@".realm"];
//    
//    // 将这个配置应用到默认的 Realm 数据库当中
//    [RLMRealmConfiguration setDefaultConfiguration:config];
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
