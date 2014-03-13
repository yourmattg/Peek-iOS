//
//  PKFriendship.h
//  Peek
//
//  Created by Matthew Graf on 3/13/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <Parse/Parse.h>

@interface PKFriendship : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *firstUserObjectId;
@property (nonatomic, strong) NSString *secondUserObjectId;
@property BOOL accepted;

@end
