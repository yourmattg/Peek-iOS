//
//  PKContact.m
//  Peek
//
//  Created by Matthew Graf on 2/12/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import "PKContact.h"
#import <Parse/PFObject+Subclass.h>

@implementation PKContact

static PKContact *currentContact;

@dynamic userObjectId;
@dynamic user;
@dynamic name;
@dynamic phone;
@dynamic photoURI;

+(NSString*)parseClassName{
    return @"Contact";
}

+(PKContact*)currentContact{
    return currentContact;
}

+(void)setCurrentContact:(PKContact *)contact{
    currentContact = contact;
}

@end
