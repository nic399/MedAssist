//
//  TSMLog.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMLog.h"

@implementation TSMLog

//Graph all DataPoints from after a specific time
- (void)graphData:(time_t)start {
    return;
}

//Perform statistical analysis on all DataPoints from after a specific time
- (void)analyzeData:(time_t)start {
    return;
}

//Add a new DataPoint to the Log
- (void)addData:(TSMDataPoint *)data {
    [self.dataPoints addObject:data];
}

//Add a new Note to the Log
- (void)addNote:(TSMNote *)note {
    [self.notes addObject:note];
}

//Delete old DataPoints
- (void)update {
    return;
}

//Add a Vaccination to the Log
- (void)addVaccination:(TSMVaccination *)vaccination {
    [self.vaccinations addObject:vaccination];
}

//Create a new empty Log
- (id)init {
    self = [super init];
    if (self) {
        self.notes = [[NSMutableArray alloc] init];
        self.vaccinations = [[NSMutableArray alloc] init];
        self.dataPoints = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
