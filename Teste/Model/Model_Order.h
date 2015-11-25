//
//  Model_Order.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Order : NSObject
@property(strong,nonatomic)NSNumber * pk_order;
@property(strong,nonatomic)NSNumber * fk_user;
@property(strong,nonatomic)NSNumber * fk_dish;
@property(strong,nonatomic)NSNumber * fk_chef;
@property(strong,nonatomic)NSNumber * fk_address;
@property(strong,nonatomic)NSDate * add_time;
@property(strong,nonatomic)NSDate * arrival_time;
@property(strong,nonatomic)NSDate * eta_time;
@property(strong,nonatomic)NSNumber * count;
@property(strong,nonatomic)NSNumber * money;
@property(strong,nonatomic)NSNumber * process;
@property(strong,nonatomic)NSString * desc;
@property(strong,nonatomic)NSNumber * enable;
@end
