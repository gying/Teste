//
//  Model_Chef.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Chef : NSObject
@property(strong,nonatomic)NSNumber * pk_chef;
@property(strong,nonatomic)NSString * avatar_path;
@property(strong,nonatomic)NSString * remark;
@property(strong,nonatomic)NSString * phone;
@property(strong,nonatomic)NSString * name;
@property(strong,nonatomic)NSDate * add_time;
@property(strong,nonatomic)NSNumber * level;
@property(strong,nonatomic)NSNumber * type;
@property(strong,nonatomic)NSNumber * enable;
@end
