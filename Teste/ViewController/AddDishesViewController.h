//
//  AddDishesViewController.h
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Dish.h"
@protocol AddDishDelegate <NSObject>
- (void)addDish:(Model_Dish *)dish;

@end

@interface AddDishesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishRatingTextField;

@property (weak, nonatomic) IBOutlet UILabel *chefLabel;

@property (weak, nonatomic) IBOutlet UITextView *dishDescTextView;

@property id<AddDishDelegate> delegate;
@end
