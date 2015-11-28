//
//  ChooseChefViewController.h
//  Teste
//
//  Created by Agree on 15/11/28.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Dish.h"
#import "Model_Chef.h"

@protocol AddChefDelegate <NSObject>

-(void)addChef: (Model_Chef *)chef;

@end

@interface ChooseChefViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property id<AddChefDelegate> delegate;




@end
