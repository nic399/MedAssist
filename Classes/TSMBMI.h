//
//  TSMBMI.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMDataPoint.h"

@interface TSMBMI : TSMDataPoint

@property (nonatomic) float height;
@property (nonatomic) float weight;

- (id)initWithValues:(float)height weight:(float)weight timestamp:(time_t)timestamp;
- (id)init;

@end
