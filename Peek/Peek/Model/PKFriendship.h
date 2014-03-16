//
//  PKFriendship.h
//  Peek
//
//  Created by Matthew Graf on 3/13/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <Parse/Parse.h>
#import "PKUser.h"

@interface PKFriendship : PFObject<PFSubclassing>

@property (nonatomic, strong) PKUser *requestingUser;
@property (nonatomic, strong) PKUser *requestedUser;
@property (nonatomic, strong) NSNumber *accepted;
@property (nonatomic, strong) NSDate *acceptDate;

@end
