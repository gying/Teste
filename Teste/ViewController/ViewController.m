//
//  ViewController.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "ViewController.h"
#import "DishesTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.DishesTableView.delegate = self;
    self.DishesTableView.dataSource = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- DishesTableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DishesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DishesTableViewCell" forIndexPath:indexPath ];
    if (nil == cell) {
        cell = [[DishesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DishesTableViewCell"];
    }
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
    

    
}

@end
