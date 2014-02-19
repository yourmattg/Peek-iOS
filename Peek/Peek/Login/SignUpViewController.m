//
//  SignUpViewController.m
//  Peek
//
//  Created by Matthew Graf on 12/3/13.
//  Copyright (c) 2013 mattgraf. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Peek"];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:40]];
    [label sizeToFit];
    self.signUpView.logo = label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
