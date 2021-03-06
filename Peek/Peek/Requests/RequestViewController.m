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
#import "PKContact.h"
#import "AddContactViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

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
    UIBarButtonItem *meButton = [[UIBarButtonItem alloc] initWithTitle:@"me" style:UIBarButtonItemStylePlain target:self action:@selector(meButtonClick)];
    [self.navigationItem setLeftBarButtonItem:meButton];
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

#pragma mark - Adding contacts

-(void)addContactClicked{
    [self performSegueWithIdentifier:@"AddContact" sender:self];
}

-(void)meButtonClicked{
    [self performSegueWithIdentifier:@"Profile" sender:self];
}

#pragma mark - Pulling friends list

-(void)fetchContacts{
    PFQuery *query = [PFQuery queryWithClassName:@"Contact"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *friends, NSError *error) {
        // TODO: dafuq do i do here
    }];
}

#pragma mark - Log in delegate

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    NSLog(@"Logged in");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // TODO: fetch friends list
    [self fetchContacts];
}

#pragma mark - Sign up delegate

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error{
    NSLog(@"Failed to sign up: %@", [error localizedDescription]);
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user{
    // Create a PKContact for this user
    PKContact *contact = [PKContact object];
    contact.userObjectId = user.objectId;
    // TODO: uncommment this
    //[contact saveInBackground];
}

@end
