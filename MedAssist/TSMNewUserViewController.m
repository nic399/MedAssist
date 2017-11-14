//
//  TSMNewUserViewController.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMNewUserViewController.h"
extern NSMutableArray *profileSetup;

@interface TSMNewUserViewController ()

@end

@implementation TSMNewUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([_firstNameField.text length] > 0 && [_lastNameField.text length] > 0) {
        NSLog(@"name entered");
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}
 */


- (IBAction)cancelButton:(UIButton *)sender {
}

- (IBAction)continueButton:(id)sender {
    if ([_firstNameField.text length] > 0 && [_lastNameField.text length] > 0) {
        NSLog(@"name entered");
        profileSetup[0] = _birthDatePicker.date;
        profileSetup[1] = _usernameField.text;
        profileSetup[2] = _firstNameField.text;
        profileSetup[3] = _lastNameField.text;
        profileSetup[5] = _emailField.text;
        NSLog(@"profile setup updated");
    }
    
}
@end
