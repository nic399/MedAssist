//
//  TSMNote.h
//  MedAssist
//
//  Created by Adam Dekleer on 10/14/14.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMNote : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *info;

- (id)initWithInfo:(NSString *)name info:(NSString *)info;
- (id)init;

@end
