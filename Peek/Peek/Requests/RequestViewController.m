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

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setTranslucent:NO];

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
    NSLog(@"Sign up success");
}

@end
