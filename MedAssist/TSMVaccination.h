//
//  TSMVaccination.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMVaccination : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) time_t date;

- (id)init;
- (id)initWithValues:(NSString *)name date:(time_t)date;

@end
