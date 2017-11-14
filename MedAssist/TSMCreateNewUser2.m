//
//  TSMCreateNewUser2.m
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-27.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMCreateNewUser2.h"
extern NSMutableArray *profileSetup;
BOOL isOn = NO;
@implementation TSMCreateNewUser2

- (IBAction)CancelButton:(UIButton *)sender {
}

- (IBAction)CreateButton:(UIButton *)sender {
    NSComparisonResult res = [_PasswordField.text compare:_ConfirmField.text];
    BOOL passwordMatch = NO;
    switch (res)
    { case NSOrderedAscending:
            passwordMatch = NO;
            break;
        case NSOrderedSame:
            passwordMatch = YES;
            break;
        case NSOrderedDescending:
            passwordMatch = NO;
            break;
        default:
            break;
    }
    if (isOn && [_PasswordField.text length] > 0 && passwordMatch) {
        NSLog(@"passwords match");
        profileSetup[4] = _PasswordField.text;
        profileSetup[6] = _GenderField.text;
        profileSetup[7] = _CarecardField.text;
        profileSetup[8] = _HINField.text;
        profileSetup[9] = _AltHINField.text;
    }
}

- (IBAction)TermsOfUseSwitch:(UISwitch *)sender { isOn = sender.isOn;
}
@end
