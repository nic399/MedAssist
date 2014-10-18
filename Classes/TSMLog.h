//
//  TSMLog.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMDataPoint.h"
#import "TSMVaccination.h"
#import "TSMNote.h"

@interface TSMLog : NSObject

@property NSMutableArray *vaccinations;
@property NSMutableArray *notes;
@property NSMutableArray *dataPoints;

- (void)graphData:(time_t)start;
- (void)analyzeData:(time_t)start;
- (void)addData:(TSMDataPoint *)data;
- (void)addNote:(TSMNote *)note;
- (void)update;
- (void)addVaccination:(TSMVaccination *)vaccination;
- (id)init;

@end
