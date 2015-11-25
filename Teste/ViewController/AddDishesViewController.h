//
//  AddDishesViewController.h
//  ShareKitchen
//
//  Created by Agree on 15/11/24.
//  Copyright © 2015年 Agree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDishesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dishName;
@property (weak, nonatomic) IBOutlet UITextField *dishPrice;
@property (weak, nonatomic) IBOutlet UITextField *dishRating;
@property (weak, nonatomic) IBOutlet UITextField *chef;
@property (weak, nonatomic) IBOutlet UITextView *dishDesc;


@end
