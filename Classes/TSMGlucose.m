//
//  TSMGlucose.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMGlucose.h"
#include <time.h>

@implementation TSMGlucose


//Create a new Glucose DataPoint with a given glucose reading and timestamp
- (id)initWithGlucose:(float)glucose timestamp:(time_t)timestamp {
    self = [super initWithTime:timestamp];
    if (self) {
        self.glucose = glucose;
    }
    return self;
}

//Create a Glucose DataPoint with a zero reading for glucose and the current system time for the timestamp
- (id)init {
    return [self initWithGlucose:0 timestamp:time(NULL)];
}

@end
