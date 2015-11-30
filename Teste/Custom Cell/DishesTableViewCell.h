//
//  DishesTableViewCell.h
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Dish.h"

@interface DishesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *allIssuedlabel;

@property (weak, nonatomic) IBOutlet UILabel *issuedLabel;
@property (weak, nonatomic) IBOutlet UILabel *notIssuedLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *chefLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


- (void)initWithdish:(Model_Dish *)dish;

@end
