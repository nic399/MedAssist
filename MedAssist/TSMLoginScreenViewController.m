//
//  TSMLoginScreenViewController.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-15.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMLoginScreenViewController.h"

@interface TSMLoginScreenViewController ()

@end

@implementation TSMLoginScreenViewController

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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unwindToLogin:(UIStoryboardSegue *)unwindSegue
{
    
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)signinTapped:(id)sender {
    
    NSInteger success = 0;
    @try {
        
        if([[self.usernameField text] isEqualToString:@""] || [[self.passwordField text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Please enter Username and Password" :@"Sign in Failed" :0];
            
        } else {
            if ([[self.usernameField text] isEqualToString:@"username"] && [[self.passwordField text] isEqualToString:@"password"] )
            {
                success = 1;
                NSLog(@"Success: %ld",(long)success);
                
            } else {
                //if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Sign in Failed" :0];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    NSLog(@"Success: %ld",(long)success);
    if (success==1) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end