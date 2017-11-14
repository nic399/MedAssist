//
//  TSMCustomData.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMDataPoint.h"

@interface TSMCustomData : TSMDataPoint

@property (nonatomic) float data;
@property (nonatomic) NSString *type;

- (id)initWithValues:(float)data type:(NSString *)type timestamp:(time_t)timestamp;
- (id)init;

@end
