//
//  AddDishesViewController.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "AddDishesViewController.h"
#import "Model_Dish.h"
#import "TENetManager.h"

@interface AddDishesViewController ()

@end

@implementation AddDishesViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad]; 
    // Do any additional setup after loading the view.
    
#pragma mark -- 上传dish
//    [TENetManager requestNetWithDic:[TENetManager addDish:_dish] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
    //成功
//        code
//    } failure:^(NSError *error, NSURLSessionDataTask *task) {
    //失败
//        code
//    }]；
    
}

//完成添加
- (IBAction)tapDoneButton:(id)sender {
    Model_Dish * dish = [Model_Dish new];
    dish.name = self.dishNameTextField.text;
    dish.price = [NSNumber numberWithFloat:[self.dishPriceTextField.text floatValue]];
    dish.rating = [NSNumber numberWithFloat:[self.dishRatingTextField.text floatValue]];
    dish.fk_chef = [NSNumber numberWithFloat:[self.chefTextField.text floatValue]];
    dish.remark = self.dishDescTextView.text;
#pragma mark -- 上传dish
    [TENetManager requestNetWithDic:[TENetManager addDish:dish] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        //成功
        } failure:^(NSError *error, NSURLSessionDataTask *task) {
            //失败
        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
