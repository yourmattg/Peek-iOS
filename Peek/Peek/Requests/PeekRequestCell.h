//
//  PeekRequestCell.h
//  Peek
//
//  Created by Matthew Graf on 3/14/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeekRequestCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UIButton *requestButton;

@end
