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

@dynamic userObjectId;
@dynamic name;
@dynamic phone;
@dynamic photoURI;

+(NSString*)parseClassName{
    return @"PKContact";
}


@end
