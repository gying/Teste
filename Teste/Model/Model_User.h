//
//  Model_User.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_User : NSObject
@property(strong,nonatomic)NSNumber * pk_user;
@property(strong,nonatomic)NSString * avatar_path;
@property(strong,nonatomic)NSString * wechat_sn;
@property(strong,nonatomic)NSString * phone;
@property(strong,nonatomic)NSNumber * type;
@property(strong,nonatomic)NSString * nickname;
@property(strong,nonatomic)NSDate * add_time;
@property(strong,nonatomic)NSNumber * enable;
@end
