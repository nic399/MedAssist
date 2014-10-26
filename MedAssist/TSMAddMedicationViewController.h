//
//  TSMAddMedicationViewController.h
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMAddMedicationViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{
    __weak IBOutlet UITextField *medicationNameTextField;
    __weak IBOutlet UITextField *purposeTextField;
    __weak IBOutlet UITextView *instructionsTextField;

    __weak IBOutlet UIDatePicker *timePicker;
    
}

@property (weak, nonatomic)__weak IBOutlet UIPickerView *frequencyPicker;
@property NSString* startDate;
@property long frequency;
@property (strong, nonatomic)  NSArray *frequencyArray;
-(IBAction)saveMedication:(id)sender;
@end
