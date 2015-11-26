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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *_dishesAry;
    DishesDetailViewController * _childController;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.DishesTableView.delegate = self;
    self.DishesTableView.dataSource = self;
    //下载数据
    _dishesAry = [NSMutableArray new];
    [TENetManager requestNetWithDic:[TENetManager allDishes:[Model_Dish new]] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        if (jsonDic) {
            _dishesAry = [Model_Dish mj_objectArrayWithKeyValuesArray:jsonDic];
        }
        [self.DishesTableView reloadData];
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
    cell.textLabel.text = dish.name;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Model_Dish * dish = [_dishesAry objectAtIndex:indexPath.row];
}

//tapNextPage
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([@"GoDishesDetailViewController" isEqualToString:segue.identifier]) {
        //进入预付界面
        Model_Dish * dish = [_dishesAry objectAtIndex:[self.DishesTableView indexPathForCell:sender].row];
        DishesDetailViewController *childController = (DishesDetailViewController *)segue.destinationViewController;
        childController.dish = dish;
    }
    
}

@end
