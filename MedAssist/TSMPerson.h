//
//  TSMPerson.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-16.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMContact.h"

typedef enum : NSUInteger {
    Family,
    Doctor,
    Pharmasist,
    Other
} Relationship;

@interface TSMPerson : TSMContact

@property NSString *firstName;
@property NSString *lastName;
@property enum Relationship relation;
@property NSString *address;




@end