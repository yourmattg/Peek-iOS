//
//  ContactRequestCell.h
//  Peek
//
//  Created by Matthew Graf on 11/12/13.
//  Copyright (c) 2013 mattgraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKUser.h"

@interface ContactRequestCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *contactImageView;
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UIButton *addButton;
@property (nonatomic, strong) PKUser *contact;

@end
