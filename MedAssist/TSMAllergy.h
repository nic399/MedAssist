//
//  TSMAllergy.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-17.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMPrescription.h"

@interface TSMAllergy : TSMPrescription

@property NSString * name;
@property NSString * severity;
@property NSString * effects;

@end
