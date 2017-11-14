//
//  TSMCustomData.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMCustomData.h"
#include <time.h>

@implementation TSMCustomData

//Create a new CustomData DataPoint with given type and data values as well as a given timestamp
- (id)initWithValues:(float)data type:(NSString *)type timestamp:(time_t)timestamp {
    self = [super initWithTime:timestamp];
    if (self) {
        self.type = type;
        self.data = data;
    }
    return self;
}

//Create a CustomData point with zero data, a blank type, and the curent system time as the timestamp
- (id)init {
    return [self initWithValues:0 type:@"" timestamp:time(NULL)];
}

@end
