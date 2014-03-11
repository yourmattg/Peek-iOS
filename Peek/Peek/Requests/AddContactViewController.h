//
//  AddContactViewController.h
//  Peek
//
//  Created by Matthew Graf on 2/19/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddContactViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *userSearchBar;
@property (nonatomic, strong) NSArray *usersArray;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
