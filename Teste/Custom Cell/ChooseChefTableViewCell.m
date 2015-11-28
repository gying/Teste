//
//  ChooseChefTableViewCell.m
//  Teste
//
//  Created by Agree on 15/11/28.
//  Copyright © 2015年 superRabbit. All rights reserved.
//

#import "ChooseChefTableViewCell.h"

@implementation ChooseChefTableViewCell












- (void)initWithChef:(Model_Chef *)chef{
//    self.textLabel.text = [NSString stringWithFormat:@"%@",chef.name];
    self.textLabel.text = chef.name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
