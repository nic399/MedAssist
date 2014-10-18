//
//  TSMNote.m
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import "TSMNote.h"

@implementation TSMNote


//Create a new Note with given values for name and info
- (id)initWithInfo:(NSString *)name info:(NSString *)info {
    self = [super init];
    if (self) {
        self.name = name;
        self.info = info;
    }
    return self;
}

//Create an empty Note
- (id)init {
    return [self initWithInfo:@"" info:@""];
}

@end
