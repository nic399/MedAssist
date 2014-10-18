//
//  TSMDataPoint.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMDataPoint : NSObject

@property  (nonatomic) time_t timestamp;

- (id)initWithTime:(time_t)timestamp;
- (id)init;

@end
