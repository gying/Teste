//
//  TENetManager.m
//  Teste
//
//  Created by G4ddle on 15/11/25.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import "TENetManager.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>

@implementation TENetManager

@synthesize completeBlock;
@synthesize failureBlock;

+ (void)requestNetWithDic:(NSMutableDictionary *)sendDic
                 complete:(finishCallbackBlock)completeBlock
                  failure:(requestFailureBlock)failureBlock {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseUrlString, kInterfaceUrlString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    TENetManager *netManager = [[TENetManager alloc] init];
    netManager.completeBlock = completeBlock;
    netManager.failureBlock = failureBlock;
    
    [manager POST:urlString
       parameters:sendDic
          success:^(NSURLSessionDataTask *task, id responseObject) {
              //返回成功
              if (netManager.completeBlock) {
                  
                  NSMutableDictionary *dic = responseObject;
                  int interfaceType = [[dic  objectForKey:@"interface"] intValue];
                  id returnData = [dic objectForKey:@"returnData"];
                  
                  if (![dic  objectForKey:@"statusMsg"]) {
                      //如果返回信息码不存在
                      netManager.completeBlock(@"返回信息码不存在", nil, interfaceType, task);
                  } else {
                      //返回信息码存在
                      NSNumber *statusNum = [dic  objectForKey:@"statusMsg"];
                      if (0 == statusNum.intValue) {
                          netManager.completeBlock(@"返回信息码为0", nil, interfaceType, task);
                      } else {
                          if (returnData) {
                              //返回数据存在
                              netManager.completeBlock(@"接口返回成功", returnData, interfaceType, task);
                          }else {
                              //返回数据不存在
                              netManager.completeBlock(@"接口返回成功,但是数据为空", nil, interfaceType, task);
                          }
                      }
                  }
              }
          } failure:^(NSURLSessionDataTask *task, NSError *error) {
              //请求失败
              if (netManager.failureBlock) {
                  [SVProgressHUD showErrorWithStatus:@"网络错误"];
                  netManager.failureBlock(error, task);
              }
          }
     ];
}

// 将字典或者数组转化为JSON串
+ (NSData *)toJSONData:(id)theData{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:0
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

+ (NSMutableDictionary *)toRequestDicWithData: (id)requestData andRequestType:(int)requestType {
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    
    [requestDic setObject:[NSNumber numberWithInt:requestType] forKey:@"request_type"];
    if ([requestData isKindOfClass:[NSDictionary class]]) {
        //如果数据为数组
        [requestDic setObject:[[NSString alloc] initWithData:[TENetManager toJSONData:requestData] encoding:NSUTF8StringEncoding] forKey:@"request_data"];
    } else {
        //如果数据为字符串 (暂定二重判断)
        [requestDic setObject:[[NSString alloc] initWithData:[TENetManager toJSONData:requestData] encoding:NSUTF8StringEncoding] forKey:@"request_data"];
    }
    
    return requestDic;
}


+ (NSMutableDictionary *)addDish: (Model_Dish *)dish {
    return [TENetManager toRequestDicWithData:dish.mj_keyValues
                                andRequestType:kAddDish];
}


+ (NSMutableDictionary *)dishesFromChef: (Model_Chef *)chef {
    return [TENetManager toRequestDicWithData:chef.mj_keyValues
                               andRequestType:kDishesFromChef];
}

+ (NSMutableDictionary *)allDishes: (Model_Dish *)dish {
    return [TENetManager toRequestDicWithData:dish.mj_keyValues
                               andRequestType:kAllDishes];
}


+ (NSMutableDictionary *)disableDish: (Model_Dish *)dish {
    Model_Dish *sendDish = [Model_Dish new];
    sendDish.pk_dish = dish.pk_dish;
    sendDish.enable = @0;
    return [TENetManager toRequestDicWithData:sendDish.mj_keyValues
                               andRequestType:kUpdateDish];
}

+ (NSMutableDictionary *)updateDish: (Model_Dish *)dish {
    return [TENetManager toRequestDicWithData:dish.mj_keyValues
                               andRequestType:kUpdateDish];
}

+ (NSMutableDictionary *)allChefs {
    return [TENetManager toRequestDicWithData:[NSDictionary new]
                               andRequestType:kAllChefs];
}




@end
