//
//  DishesTableViewCell.m
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import "DishesTableViewCell.h"


@implementation DishesTableViewCell















- (void)initWithdish:(Model_Dish *)dish{
    self.dishNameLabel.text = dish.name;
    self.chefLabel.text = [NSString stringWithFormat:@"%@",dish.fk_chef];
    self.priceLabel.text = [NSString stringWithFormat:@"%@",dish.price];
    self.issuedLabel.text = @"999";
    self.notIssuedLabel.text = @"999";
    
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
