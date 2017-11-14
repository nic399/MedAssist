//
//  TSMProfile.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMProfile.h"
#import "TSMContact.h"
#import "TSMNotification.h"

@implementation TSMProfile

-(NSString *)passwordHash {
    NSString * userPassphrase;
    return NULL;
}

-(NSMutableArray *) healthInsuranceNumbers {
    
    return NULL;
}

-(NSDate *)birthDate {
    
    return NULL;
}

-(NSString *)carecard {
    
    return NULL;
}

-(void)setPasswordHash:(NSString *)hashedPass {
    
}

-(void)setHealthInsuranceNumbers {
    
}

-(void)setBirthdate {
    
}

-(void)setCarecard:(NSString *)carecard {
    
}

/*
//Add a notification to the user's list of Notifications
- (void)addNotification:(TSMNotification *)notification {
    [self.notifications addObject:notification];
}

//Add a contact to the user's list of Contacts
- (void)addContact:(TSMContact *)contact {
    [self.contacts addObject:contact];
}
*/ 

//Call the Profile's emergency contact
//- (void)callEmergencyContact {
//    return;
//}


//Create a new Profile with empty properties
/*- (id)init {
    self = [super init];
    if (self) {
        self.firstName = @"";
        self.lastName = @"";
        self.userName = @"";
        self.password = @"";
        self.email = @"";
        self.gender = @"";
        self.healthInsurance = @"";
        self.notifications = [[NSMutableArray alloc] init];
        self.contacts = [[NSMutableArray alloc] init];
        self.profileLog = [[TSMLog alloc] init];
        self.emergencyContact = [[TSMContact alloc] init];
        self.avatar = [[UIImage alloc] init];
    }
    return self;
}*/

@end
