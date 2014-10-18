//
//  TSMVaccination.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMVaccination.h"
#include <time.h>

@implementation TSMVaccination


//Create a new Vaccination with a given name and date
- (id)initWithValues:(NSString *)name date:(time_t)date {
    self = [super init];
    if (self) {
        self.name = name;
        self.date = date;
    }
    return self;
}

//Return a nameless Vaccination with the current system time
- (id)init {
    return [self initWithValues:@"" date:time(NULL)];
}

@end
