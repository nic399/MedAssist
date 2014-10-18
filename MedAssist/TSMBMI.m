//
//  TSMBMI.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMBMI.h"
#include <time.h>

@implementation TSMBMI


//Create a new BMI DataPoint with given values for height, weight, and timestamp
- (id)initWithValues:(float)height weight:(float)weight timestamp:(time_t)timestamp{
    self = [super initWithTime:timestamp];
    if (self) {
        self.height = height;
        self.weight = weight;
    }
    return self;
}

//Create a BMI DataPoint with zero for height and weight and the current system time as a timestamp
- (id)init {
    return [self initWithValues:0 weight:0 timestamp:time(NULL)];
}

@end
