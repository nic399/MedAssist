//
//  TSMCreateNewUser2.h
//  MedAssist
//
//  Created by Nicholas Fung on 2014-10-27.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMAppDelegate.h"

@interface TSMCreateNewUser2 : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *HINField;
@property (weak, nonatomic) IBOutlet UITextField *AltHINField;
@property (weak, nonatomic) IBOutlet UITextField *CarecardField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UITextField *GenderField;
@property (weak, nonatomic) IBOutlet UITextField *ConfirmField;
@property (weak, nonatomic) IBOutlet UISwitch *TermsOfUseSwitch;
- (IBAction)CancelButton:(UIButton *)sender;
- (IBAction)CreateButton:(UIButton *)sender;
- (IBAction)TermsOfUseSwitch:(UISwitch *)sender;

@end
