//
//  DemoRelamViewController.m
//  Demo
//
//  Created by fan on 17/7/9.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "DemoRelamViewController.h"
#import "DemoViewController.h"
#import <Realm.h>
#import "PersonModel.h"
@interface DemoRelamViewController (){

    RLMRealm *realm;
    
}
@property (weak, nonatomic) IBOutlet UITextField *phonetext;
@property (weak, nonatomic) IBOutlet UITextField *passwordtext;

@end

@implementation DemoRelamViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (IBAction)login:(UIButton *)sender {
    

    [[NSUserDefaults standardUserDefaults] setObject:self.phonetext.text forKey:@"loginName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    DemoViewController *vc =[[DemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    RLMResults *arr = [PersonModel allObjects];
//    NSLog(@"%@",arr);
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
