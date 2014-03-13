//
//  PKContact.h
//  Peek
//
//  Created by Matthew Graf on 2/12/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface PKContact : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *userObjectId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *photoURI;

+(NSString*)parseClassName;

@end
