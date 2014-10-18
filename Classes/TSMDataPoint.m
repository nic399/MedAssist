//
//  TSMDataPoint.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMDataPoint.h"
#include <time.h>

@implementation TSMDataPoint


//Create a new DataPoint with a given timestamp
- (id)initWithTime:(time_t)timestamp {
    self = [super init];
    if (self) {
        self.timestamp = timestamp;
    }
    return self;
}

//Create a new DataPoint with the current system time as the timestamp
- (id)init {
    return [self initWithTime:time(NULL)];
}

@end
