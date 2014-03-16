//
//  PKContact.m
//  Peek
//
//  Created by Matthew Graf on 2/12/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import "PKUser.h"
#import <Parse/PFObject+Subclass.h>

@implementation PKUser

static PKUser *currentUser;

@dynamic name;
@dynamic phone;
@dynamic photoURI;

+(NSString*)parseClassName{
    return [super parseClassName];
}

+(PKUser*)currentUser{
    return currentUser;
}

+(void)setCurrentUser:(PKUser *)user{
    currentUser = user;
}

@end
