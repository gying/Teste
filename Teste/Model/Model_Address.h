//
//  Model_Address.h
//  Teste
//
//  Created by Agree on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Address : NSObject
@property(strong,nonatomic)NSNumber * pk_address;
@property(strong,nonatomic)NSNumber * fk_user;
@property(strong,nonatomic)NSString * contacts;
@property(strong,nonatomic)NSString * phone;
@property(strong,nonatomic)NSString * address;
@property(strong,nonatomic)NSString * desc;
@property(strong,nonatomic)NSString * zipcode;
@property(strong,nonatomic)NSNumber * enable;

@end
