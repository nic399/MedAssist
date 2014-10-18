//
//  TSMAppointment.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-17.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMNotification.h"

typedef enum : NSUInteger {
    Once,
    Daily,
    Weekly,
    EveryTwoWeeks,
    Monthly,
    Yearly
} Recurrence;

typedef enum : NSUInteger {
    FamilyDoctor,
    Specialist,
    MedicalTest,
    PrescriptionRefill,
    Other
} AppointmentType;

@interface TSMAppointment : TSMNotification

@property AppointmentType type;
@property time_t time;
@property NSString * place;
@property NSString * specialInstructions;
@property Recurrence recurrence;
@property NSString * name;

@end
