//
//  TSMMedication.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-17.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMPrescription.h"

@interface TSMMedication : TSMPrescription

@property NSString * name;
@property NSString * purpose;
@property NSString * specialInstructions;
@property NSString * frequency;
@property NSDate * time;
@property int photo;

@end