//
//  TSMProfile.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMNotification.h"
#import "TSMContact.h"
#import "TSMLog.h"

@interface TSMProfile : NSObject {
    
}

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *gender;
@property (nonatomic) TSMLog *profileLog;
@property (nonatomic) NSMutableArray *notifications;
@property (nonatomic) NSMutableArray *contacts;
@property (nonatomic) TSMContact *emergencyContact;
@property (nonatomic) UIImage *avatar;
@property NSString * passwordHash;
@property NSMutableArray * healthInsuranceNumbers;
@property NSDate * birthDate;
@property NSString *carecard;


-(NSString *) passwordHash;
-(NSMutableArray *) healthInsuranceNumbers;
-(NSDate *)birthDate;
-(NSString *)carecard;

-(void)setPasswordHash:(NSString *)hashedPass;
-(void)setHealthInsuranceNumbers;
-(void)setBirthdate;
-(void)setCarecard:(NSString *)carecard;

//- (void)addNotification:(TSMNotification *)notification;
//- (void)addContact:(TSMContact *)contact;
//- (void)callEmergencyContact;


//- (id)init;

@end
