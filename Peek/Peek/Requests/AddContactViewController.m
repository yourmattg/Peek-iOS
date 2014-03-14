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
#import "PKFriendship.h"

static const CGFloat ROW_HEIGHT = 50.0;

@interface AddContactViewController ()

@end

@implementation AddContactViewController

@synthesize contactsArray;
@synthesize userSearchBar;

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
    PFQuery *query = [PKContact query];
    [query whereKey:@"username" containsString:searchParam];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            contactsArray = objects;
            [self.tableView reloadData];
        }
        else{
            NSLog(@"%@", [error userInfo]);
        }
    }];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

#pragma mark - Adding friends

-(void)addFriendClick:(id)sender{
    UIButton *button = (UIButton*) sender;
    NSInteger row = button.tag;
    PKContact *contact = [contactsArray objectAtIndex:row];
    
    // TODO: check if friendship already exists
    
    PKFriendship *friendship = [PKFriendship object];
    friendship.requestingContact = [PKContact currentContact];
    friendship.requestedContact = contact;
    friendship.accepted = NO;
    [friendship saveInBackground];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contactsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"AddContactCell";
    ContactRequestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[ContactRequestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    PKContact *contact = (PKContact*)[contactsArray objectAtIndex:[indexPath row]];
    [cell setContact:contact];
    [cell.addButton addTarget:self action:@selector(addFriendClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ROW_HEIGHT;
}


@end
