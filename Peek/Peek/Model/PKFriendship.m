//
//  PKFriendship.m
//  Peek
//
//  Created by Matthew Graf on 3/13/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import "PKFriendship.h"
#import <Parse/PFObject+Subclass.h>

@implementation PKFriendship

@dynamic firstUserObjectId;
@dynamic secondUserObjectId;
@dynamic accepted;

+(NSString*)parseClassName{
    return @"Friendship";
}

@end
