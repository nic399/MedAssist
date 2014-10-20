//
//  TSMAddSpecialInstructions.h
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMAddDirective : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    __weak IBOutlet UITextField *directiveNameTextField;
    __weak IBOutlet UITextView *instructionsTextField;

    __weak IBOutlet UIDatePicker *timePicker;
}

@property (weak,nonatomic) IBOutlet UIPickerView *frequencyPicker;
@property NSString* startDate;
@property NSString* endDate;
@property NSInteger frequency;
@property (strong, nonatomic)  NSArray *frequencyArray;
-(IBAction)saveDirective:(id)sender;

@end
