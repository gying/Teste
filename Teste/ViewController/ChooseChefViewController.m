//
//  ChooseChefViewController.m
//  Teste
//
//  Created by Agree on 15/11/28.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import "ChooseChefViewController.h"
#import "ChooseChefTableViewCell.h"

@interface ChooseChefViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChooseChefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChooseChefTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseChefTableViewCell" forIndexPath:indexPath ];
    if (nil == cell) {
        cell = [[ChooseChefTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChooseChefTableViewCell"];
    }
    
//    Model_Dish * dish = [Model_Dish new];
//    [cell initWithdish:dish];
    return cell;

    
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
