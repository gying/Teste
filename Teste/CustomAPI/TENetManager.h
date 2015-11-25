//
//  TENetManager.h
//  Teste
//
//  Created by G4ddle on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Model_Dish.h"
#import "Model_Chef.h"


//接口定义地址

/*
 增加菜品
 */
#define kAddDish                 1

/*
 读取当前厨师的所有菜品
 */
#define kDishesFromChef          2

/*
 读取所有菜品
 */
#define kAllDishes              3



//定义请求地址
#define kBaseUrlString  @"http://120.26.118.226/app/teste/"
#define kInterfaceUrlString @"te_interface.php"

//定义两个代码块
typedef void (^finishCallbackBlock)(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task);
typedef void (^requestFailureBlock)(NSError *error, NSURLSessionDataTask *task);

@interface TENetManager : NSObject

@property (strong)finishCallbackBlock completeBlock;
@property (strong)requestFailureBlock failureBlock;

+ (void)requestNetWithDic:(NSMutableDictionary *)sendDic
                 complete:(finishCallbackBlock)completeBlock
                  failure:(requestFailureBlock)failureBlock;


+ (NSMutableDictionary *)addDish: (Model_Dish *)dish;

@end
