//
//  TSMDirective.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-17.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMPrescription.h"

@interface TSMDirective : TSMPrescription

@property NSString * name;
@property NSDate * time;
@property NSString * specialInstructions;
@property NSString * frequency;
@property time_t endDate;

@end