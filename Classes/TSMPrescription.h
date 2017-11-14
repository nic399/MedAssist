//
//  TSMPrescription.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-17.
//  Copyright (c) 2014 Adam Dekleer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMNotification.h"

typedef enum : NSUInteger {
    type1,
    type2,
    type3,
    Other
} MedType;

@interface TSMPrescription : TSMNotification

@property int photo;
@property MedType type;

@end
