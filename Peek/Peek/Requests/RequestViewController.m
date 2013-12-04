//
//  FirstViewController.m
//  Peek
//
//  Created by Matthew Graf on 11/12/13.
//  Copyright (c) 2013 mattgraf. All rights reserved.
//

#import "RequestViewController.h"
#import "LoginViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    if(self.user == nil){
        [self showLoginController];
    }
    
    
}

-(void)showLoginController{
    LoginViewController *logInController = [[LoginViewController alloc] init];
    
    logInController.delegate = self;
    [self presentViewController:logInController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
