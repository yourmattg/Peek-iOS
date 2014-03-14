//
//  PKFriendship.h
//  Peek
//
//  Created by Matthew Graf on 3/13/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <Parse/Parse.h>
#import "PKContact.h"

@interface PKFriendship : PFObject<PFSubclassing>

@property (nonatomic, strong) PKContact *requestingContact;
@property (nonatomic, strong) PKContact *requestedContact;
@property BOOL accepted;
@property (nonatomic, strong) NSDate *acceptDate;

@end
