//
//  AddDishesViewController.h
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDishesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *dishRatingTextField;
@property (weak, nonatomic) IBOutlet UITextField *chefTextField;
@property (weak, nonatomic) IBOutlet UITextView *dishDescTextView;


@end
