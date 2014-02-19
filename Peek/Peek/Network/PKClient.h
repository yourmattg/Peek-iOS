//
//  PKClient.h
//  Peek
//
//  Created by Matthew Graf on 2/12/14.
//  Copyright (c) 2014 mattgraf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface PKClient : NSObject

-(NSMutableArray*)contactsForUser:(PFUser*)user;

@end
