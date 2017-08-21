//
//  PersonModel.h
//  Demo
//
//  Created by fan on 17/7/9.
//  Copyright © 2017年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>
@interface PersonModel : RLMObject
@property NSString *myId;
@property NSString *name;

@end
