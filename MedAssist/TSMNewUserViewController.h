//
//  TSMNewUserViewController.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMAppDelegate.h"

@interface TSMNewUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
@property (nonatomic) UIDatePickerMode UIDatePickerModeDate;
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)continueButton:(id)sender;


@end
