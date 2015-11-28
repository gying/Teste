//
//  ViewController.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "ViewController.h"
#import "DishesTableViewCell.h"
#import "TENetManager.h"
#import <MJExtension.h>
#import "Model_Dish.h"
#import "DishesDetailViewController.h"
#import "AddDishesViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate, DishDelegate,AddDishDelegate> {
    NSMutableArray *_dishesAry;
    DishesDetailViewController * _childController;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //下载数据
    _dishesAry = [NSMutableArray new];
    [self loadDataFromNet];

}

//添加菜品
-(void)addDish:(Model_Dish *)dish{
    [_dishesAry addObject:dish];
    [self.tableView reloadData];
}
//编辑菜品
-(void)editDish:(Model_Dish *)dish{
    [self.tableView reloadData];
}
//删除菜品
-(void)delDish{
    [self loadDataFromNet];
}

- (void)loadDataFromNet {
    [TENetManager requestNetWithDic:[TENetManager allDishes:[Model_Dish new]] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        if (jsonDic) {
            _dishesAry = [Model_Dish mj_objectArrayWithKeyValuesArray:jsonDic];[self dismissViewControllerAnimated:YES completion:nil];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error, NSURLSessionDataTask *task) {
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- DishesTableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_dishesAry) {
        return _dishesAry.count;
    }else{
        return 1;
    }

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DishesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DishesTableViewCell" forIndexPath:indexPath ];
    if (nil == cell) {
        cell = [[DishesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DishesTableViewCell"];
    }
    
    Model_Dish * dish = [_dishesAry objectAtIndex:indexPath.row];
    [cell initWithdish:dish];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Model_Dish * dish = [_dishesAry objectAtIndex:indexPath.row];
}

//tapNextPage
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([@"GoDishesDetailViewController" isEqualToString:segue.identifier]) {
        //进入预付界面
        Model_Dish * dish = [_dishesAry objectAtIndex:[self.tableView indexPathForCell:sender].row];
        DishesDetailViewController *childController = (DishesDetailViewController *)segue.destinationViewController;
        childController.dish = dish;
        childController.delegate = self;
    }
    if ([@"GoAddDishesViewController" isEqualToString:segue.identifier]) {
        AddDishesViewController * childController = (AddDishesViewController *)segue.destinationViewController;
        childController.delegate = self;
    }
    
}

@end
