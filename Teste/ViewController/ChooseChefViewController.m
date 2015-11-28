//
//  ChooseChefViewController.m
//  Teste
//
//  Created by Agree on 15/11/28.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import "ChooseChefViewController.h"
#import "ChooseChefTableViewCell.h"
#import "TENetManager.h"
#import <MJExtension.h>
#import "AddDishesViewController.h"

@interface ChooseChefViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChooseChefViewController{
    NSMutableArray * _chefAry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
    [self loadDataFromNet];
}

- (void)loadDataFromNet{
    [TENetManager requestNetWithDic:[TENetManager allChefs] complete:^(NSString *msgString, id jsonDic, int interType, NSURLSessionDataTask *task) {
        
        if (jsonDic) {
            _chefAry = [Model_Chef mj_objectArrayWithKeyValuesArray:jsonDic];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error, NSURLSessionDataTask *task) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _chefAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChooseChefTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseChefTableViewCell" forIndexPath:indexPath ];
    if (nil == cell) {
        cell = [[ChooseChefTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChooseChefTableViewCell"];
    }
    Model_Chef * chef = [_chefAry objectAtIndex:indexPath.row];
    [cell initWithChef:chef];
//    cell.textLabel.text = chef.name;
    return cell;

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Model_Chef * chef = [_chefAry objectAtIndex:indexPath.row];
    [self.delegate addChef:chef];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)tapBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    


    
}


@end
