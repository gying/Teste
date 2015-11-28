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
#import "ChooseChefViewController.h"

@interface AddDishesViewController () <AddChefDelegate>

@end

@implementation AddDishesViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad]; 
    // Do any additional setup after loading the view.
    
}

//完成添加
- (IBAction)tapDoneButton:(id)sender {
    Model_Dish * dish = [Model_Dish new];
    dish.name = self.dishNameTextField.text;
    dish.price = [NSNumber numberWithFloat:[self.dishPriceTextField.text floatValue]];
    dish.rating = [NSNumber numberWithFloat:[self.dishRatingTextField.text floatValue]];
    dish.fk_chef = [NSNumber numberWithFloat:[self.chefLabel.text floatValue]];
    
    dish.remark = self.dishDescTextView.text;
#pragma mark -- 上传dish
    [TENetManager requestNetWithDic:[TENetManager addDish:dish] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        //成功之后跟视图表格更新reloadata
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.delegate addDish:dish];
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)addChef:(Model_Chef *)chef {
    self.chefLabel.text = [NSString stringWithFormat:@"%@",chef.name];

}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"GoToChooseChef" isEqualToString:segue.identifier]) {
        ChooseChefViewController *childController = segue.destinationViewController;
        childController.delegate = self;
    } 

    
}


@end
