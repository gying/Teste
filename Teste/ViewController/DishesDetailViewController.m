//
//  DishesDetailViewController.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "DishesDetailViewController.h"
#import "TENetManager.h"
#import "ViewController.h"

@interface DishesDetailViewController ()

@end

@implementation DishesDetailViewController{
    
//    Model_Dish * _dish;
    ViewController * _rootViewControoler;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self assignment];
}

//赋值
-(void)assignment{
    self.dishNameLabel.text = self.dish.name;
    self.dishPriceLabel.text  = [NSString stringWithFormat:@"%@",self.dish.price];
    self.dishRatingLabel.text = [NSString stringWithFormat:@"%@",self.dish.rating];
    self.chefLabel.text = [NSString stringWithFormat:@"%@",self.dish.fk_chef];
    self.dishDescTextView.text = self.dish.remark;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//删除
- (IBAction)tapDeleteButton:(id)sender {
    [TENetManager requestNetWithDic:[TENetManager disableDish:self.dish] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        //成功
        [self dismissViewControllerAnimated:YES completion:nil];
        //之后跟视图表格更新reloadata
        [self.delegate dishesReloadData:nil];

    } failure:^(NSError *error, NSURLSessionDataTask *task) {
        //失败
    }];

}

//编辑
- (IBAction)tapEditButton:(id)sender {
    if ([self.editButton.titleLabel.text isEqualToString:@"编辑"]) {
        self.dishNameLabel.hidden = YES;
        self.dishPriceLabel.hidden = YES;
        self.dishRatingLabel.hidden = YES;
        self.chefLabel.hidden = YES;
        self.dishDescTextView.editable = YES;
        
        self.dishNameEditField.hidden = NO;
        self.dishPriceEditField.hidden = NO;
        self.dishRatingEditField.hidden = NO;
        self.chefEditField.hidden = NO;
        
        self.dishNameEditField.text = self.dishNameLabel.text;
        self.dishPriceEditField.text = self.dishPriceLabel.text;
        self.dishRatingEditField.text = self.dishRatingLabel.text;
        self.chefEditField.text = self.chefLabel.text;
        [self.editButton setTitle:@"保存" forState:UIControlStateNormal];
    }
    
    
    if ([self.editButton.titleLabel.text isEqualToString:@"保存"]) {
        self.dishNameLabel.hidden = NO;
        self.dishPriceLabel.hidden = NO;
        self.dishRatingLabel.hidden = NO;
        self.chefLabel.hidden = NO;
        self.dishDescTextView.editable = NO;
        
        self.dishNameEditField.hidden = YES;
        self.dishPriceEditField.hidden = YES;
        self.dishRatingEditField.hidden = YES;
        self.chefEditField.hidden = YES;
       
        //当前LABEL可以跟着更新或者推回根视图
        self.dishNameLabel.text = self.dishNameEditField.text;
        self.dishPriceLabel.text = self.dishPriceEditField.text;
        self.dishRatingLabel.text = self.dishRatingEditField.text;
        self.chefLabel.text = self.chefEditField.text;
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
        
//           [self dismissViewControllerAnimated:YES completion:nil];
        
        self.dish.name = self.dishNameEditField.text;
       self.dish.price = [NSNumber numberWithFloat:[self.dishPriceEditField.text floatValue]];
        self.dish.rating = [NSNumber numberWithFloat:[self.dishRatingEditField.text floatValue]];
        self.dish.fk_chef = [NSNumber numberWithFloat:[self.chefEditField.text floatValue]];
        //调用编辑结束后上传接口
        
        [self.delegate dishesReloadData:self.dish];
    }
    
    
}

- (IBAction)tabBackButton:(id)sender {
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
