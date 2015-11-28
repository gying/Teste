//
//  ChooseChefViewController.h
//  Teste
//
//  Created by Agree on 15/11/28.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Dish.h"

@interface ChooseChefViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic)Model_Dish * dish;

@end
