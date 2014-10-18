//
//  TSMBloodP.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMBloodP.h"
#include <time.h>

@implementation TSMBloodP


//Create a new BloodP DataPoint with given values for diastolic and systolic pressure, and a given timestamp
- (id)initWithValues:(int)systolic diastolic:(int)diastolic timestamp:(time_t)timestamp {
    self = [super initWithTime:timestamp];
    if (self) {
        self.systolic = systolic;
        self.diastolic = diastolic;
    }
    return self;
}

//Create a BloodP DataPoint with zero for both pressure readings and the current system time for the timestamp
- (id)init {
    return [self initWithValues:0 diastolic:0 timestamp:time(NULL)];
}

@end
