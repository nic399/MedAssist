//
//  TSMPerson.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-16.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMContact.h"

typedef enum NSUIInteger{
    Family,
    Doctor,
    Pharmacist,
    Other
}
Relationship;

@interface TSMPerson : TSMContact
{
    Relationship relation;
}

@property NSString *firstName;
@property NSString *lastName;
@property (nonatomic) Relationship relation;
@property NSString *address;




@end