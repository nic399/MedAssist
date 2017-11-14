//
//  TSMLoginScreenViewController.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-15.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMLoginScreenViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signinTapped:(id)sender;
- (IBAction)backgroundTap:(id)sender;

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;

@end
