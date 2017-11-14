//
//  TSMAddAllergy.m
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMAddAllergyViewController.h"
#import "TSMAppDelegate.h"

@implementation TSMAddAllergyViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self->allergyNameTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveAllergy:(id)sender{
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (allergyNameTextField.text.length>0 && severityTextField.text.length>0 &&effectsTextField.text.length>0)
        success = [[TSMDBManager getSharedInstance]saveAllergy:
                   allergyNameTextField.text severity:severityTextField.text effects:effectsTextField.text];
    
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
@end
