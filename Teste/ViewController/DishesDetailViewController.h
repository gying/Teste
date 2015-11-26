//
//  DishesDetailViewController.h
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model_Dish.h"

@protocol DishDelegate <NSObject>

- (void)dishesReloadData: (Model_Dish *)dish;

@end

@interface DishesDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *chefLabel;
@property (weak, nonatomic) IBOutlet UITextView *dishDescTextView;
@property (weak, nonatomic) IBOutlet UITextField *dishNameEditField;
@property (weak, nonatomic) IBOutlet UITextField *dishPriceEditField;
@property (weak, nonatomic) IBOutlet UITextField *dishRatingEditField;
@property (weak, nonatomic) IBOutlet UITextField *chefEditField;

@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property(strong,nonatomic)Model_Dish * dish;

@property id<DishDelegate> delegate;




@end
