//
//  DishesDetailViewController.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "DishesDetailViewController.h"

@interface DishesDetailViewController ()

@end

@implementation DishesDetailViewController{
    
    Model_Dish * _dish;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (IBAction)tapEditButton:(id)sender {
    NSLog(@"编辑");
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
