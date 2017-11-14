//
//  TSMBloodP.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMDataPoint.h"

@interface TSMBloodP : TSMDataPoint

@property (nonatomic) int systolic;
@property (nonatomic) int diastolic;

- (id)initWithValues:(int)systolic diastolic:(int)diastolic timestamp:(time_t)timestamp;
- (id)init;

@end
