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

@interface AddDishesViewController ()

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
    dish.fk_chef = [NSNumber numberWithFloat:[self.chefButton.titleLabel.text floatValue]];
    
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
//选择厨师
- (IBAction)chooseChef:(id)sender {
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


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"GoChooseChefViewControoler" isEqualToString:segue.identifier]) {
        //进入预付界面
//        Model_Dish * dish = [_dishesAry objectAtIndex:[self.tableView indexPathForCell:sender].row];
//        ChooseChefViewController *childController = (DishesDetailViewController *)segue.destinationViewController;
//        childController.dish = dish;
//        childController.delegate = self;
    }

    
}


@end
