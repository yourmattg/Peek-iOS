//
//  FirstViewController.h
//  Peek
//
//  Created by Matthew Graf on 11/12/13.
//  Copyright (c) 2013 mattgraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PKUser.h"

@interface RequestViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) PKUser *currentContact;
@property (nonatomic, strong) NSMutableArray *contactsArray;
@property (nonatomic, strong) IBOutlet UITableView *requestTableView;

@end
