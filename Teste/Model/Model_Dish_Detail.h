//
//  Model_Dish_Detail.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Dish_Detail : NSObject
@property(strong,nonatomic)NSNumber * pk_dish_detail;
@property(strong,nonatomic)NSNumber * fk_dish;
@property(strong,nonatomic)NSNumber * type;
@property(strong,nonatomic)NSString * content;
@property(strong,nonatomic)NSNumber * font;
@property(strong,nonatomic)NSString * color;
@property(strong,nonatomic)NSString * image_path;
@property(strong,nonatomic)NSNumber * background;
@property(strong,nonatomic)NSNumber * enable;

@end
