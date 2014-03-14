//
//  FirstViewController.m
//  Peek
//
//  Created by Matthew Graf on 11/12/13.
//  Copyright (c) 2013 mattgraf. All rights reserved.
//

#import "RequestViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "AddContactViewController.h"
#import "PeekRequestCell.h"
#import "PKFriendship.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

@synthesize currentUser;
@synthesize currentContact;
@synthesize contactsArray;
@synthesize requestTableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationItem setTitle:@"Requests"];
    
    // add "add contacts" button
    UIBarButtonItem *addContactButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContactClicked)];
    [self.navigationItem setRightBarButtonItem:addContactButton];
    
    // "me" button for setting user info (picture, name)
    UIBarButtonItem *editProfileButton = [[UIBarButtonItem alloc] initWithTitle:@"me" style:UIBarButtonItemStylePlain target:self action:@selector(editProfileClicked)];
    [self.navigationItem setLeftBarButtonItem:editProfileButton];
}

-(void)viewDidAppear:(BOOL)animated{
    
    if(![PFUser currentUser]){
        [self showLoginController];
    }
}

-(void)showLoginController{
    LoginViewController *logInController = [[LoginViewController alloc] init];
    
    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
    [signUpViewController setDelegate:self];
    [signUpViewController setFields:PFSignUpFieldsDefault];
    [logInController setSignUpController:signUpViewController];
    
    logInController.delegate = self;
    [self presentViewController:logInController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contactsArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *peekRequestIdentifier = @"PeekRequestCell";
    PeekRequestCell *cell = [tableView dequeueReusableCellWithIdentifier:peekRequestIdentifier];
    if(cell == nil){
        cell = [[PeekRequestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:peekRequestIdentifier];
    }
    
    NSInteger row = [indexPath row];
    PKContact *contact = [contactsArray objectAtIndex:row];
    [cell.usernameLabel setText:contact.user.username];
    
    return cell;
}

#pragma mark - Adding contacts

-(void)addContactClicked{
    [self performSegueWithIdentifier:@"AddContact" sender:self];
}

-(void)editProfileClicked{
    [self performSegueWithIdentifier:@"EditProfile" sender:self];
}

#pragma mark - Pulling friends list

-(void)fillContacts:(NSArray*)friendships{
    [contactsArray removeAllObjects];
    for(PKFriendship *friendship in friendships){
        PKContact *contactToDisplay;
        if(![friendship.requestedContact.objectId isEqualToString:currentContact.objectId]){
            contactToDisplay = friendship.requestedContact;
        }
        else{
            contactToDisplay = friendship.requestingContact;
        }
        [self.contactsArray addObject:contactToDisplay];
    }
}

-(void)fetchFriendships{
    PFQuery *query = [PKFriendship query];
    [query includeKey:@"requestingContact"];
    [query includeKey:@"requestedContact"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *friendships, NSError *error) {
        if(!error){
            [self fillContacts:friendships];
            [requestTableView reloadData];
        }
        else{
            NSLog(@"%@", [error userInfo]);
        }
    }];
}

#pragma mark - Log in delegate

-(void)createContactForUser:(PFUser*)user{
    PKContact *contact = [PKContact object];
    [contact setUserObjectId:user.objectId];
    [contact setUser:user];
    [contact saveInBackground];
    [PKContact setCurrentContact:contact];
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // make a PKContact for this user if there isn't one already
    PFQuery *query = [PKContact query];
    [query whereKey:@"userObjectId" equalTo:user.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            if([objects count] == 0){
                [self createContactForUser:user];
            }
            else{
                [PKContact setCurrentContact:[objects firstObject]];
            }
        }
        else{
            NSLog(@"%@", [error userInfo]);
        }
    }];
    
    // TODO: fetch friends list
    [self fetchFriendships];
    
}

#pragma mark - Sign up delegate

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error{
    NSLog(@"Failed to sign up: %@", [error localizedDescription]);
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user{
    [self createContactForUser:user];
}

@end
