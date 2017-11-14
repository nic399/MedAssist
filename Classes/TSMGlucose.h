//
//  TSMGlucose.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMDataPoint.h"

@interface TSMGlucose : TSMDataPoint

@property (nonatomic) float glucose;

- (id)initWithGlucose:(float)glucose timestamp:(time_t)timestamp;
- (id)init;

@end
