//
//  Model_Dish.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Dish : NSObject
@property(strong,nonatomic)NSNumber * pk_dish;
@property(strong,nonatomic)NSString * remark;
@property(strong,nonatomic)NSString * name;
@property(strong,nonatomic)NSNumber * price;
@property(strong,nonatomic)NSDate * add_time;
@property(strong,nonatomic)NSNumber * type;
@property(strong,nonatomic)NSNumber * rating;
@property(strong,nonatomic)NSNumber * fk_chef;
@property(strong,nonatomic)NSNumber * enable;

@end
