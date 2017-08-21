//
//  RealmTool.m
//  Demo
//
//  Created by fan on 17/8/21.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import "RealmTool.h"
#import "PersonModel.h"
@interface RealmTool (){

  
}
@end

@implementation RealmTool


+ (RLMRealm*)DefaultRealmForUser{
      RLMRealm *  realm;
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"loginName"] length]) {
        NSString*userName =  [[NSUserDefaults standardUserDefaults] objectForKey:@"loginName"];
        NSString *dbName = [@"Br_" stringByAppendingString:[NSString stringWithFormat:@"%@.realm",userName]];
        NSString *direcPath =[NSHomeDirectory() stringByAppendingPathComponent:@"Doucments/BrDataBase"];
        NSString *dbPath = [direcPath stringByAppendingString:dbName];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:direcPath]) {
            
          [[NSFileManager defaultManager] createDirectoryAtPath:direcPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        
     realm  = [RLMRealm realmWithURL:[NSURL URLWithString:dbPath]];
    }else{
    
        realm = [RLMRealm defaultRealm];
    }

    return realm;
    
}
@end
