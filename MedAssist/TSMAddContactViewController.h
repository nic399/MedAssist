//
//  TSMAddContactViewController.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-16.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AddressBookUI/AddressBookUI.h>

@interface TSMAddContactViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>

- (IBAction)showPicker:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *firstName;

@end
