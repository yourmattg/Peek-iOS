//
//  AddContactViewController.m
//  Peek
//
//  Created by Matthew Graf on 2/19/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import "AddContactViewController.h"
#import <Parse/Parse.h>
#import "ContactRequestCell.h"

static const CGFloat ROW_HEIGHT = 50.0;

@interface AddContactViewController ()

@end

@implementation AddContactViewController

@synthesize usersArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonClick:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Search bar

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *searchParam = [searchBar text];
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" containsString:searchParam];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            usersArray = objects;
            [self.tableView reloadData];
            NSLog(@"%d users found", [objects count]);
        }
        else{
            NSLog(@"%@", [error userInfo]);
        }
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [usersArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"AddContactCell";
    ContactRequestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[ContactRequestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    PFUser *user = (PFUser*)[usersArray objectAtIndex:[indexPath row]];
    [cell.usernameLabel setText:[user username]];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ROW_HEIGHT;
}


@end
