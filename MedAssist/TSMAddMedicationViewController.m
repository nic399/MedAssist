//
//  TSMAddMedicationViewController.m
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMAddMedicationViewController.h"
#import "TSMAppDelegate.h"

@implementation TSMAddMedicationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.startDate = strDate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self) {
        self.frequencyArray  = [[NSArray alloc]         initWithObjects:@"Hourly",@"Daily",@"Weekly",@"Bi-weekly",@"Monthly",@"Yearly" , nil];
    }
    
    self.frequencyPicker.dataSource=self;
    self.frequencyPicker.delegate=self;
    [self->timePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    self->medicationNameTextField.delegate = self;
    self->instructionsTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)saveMedication:(id)sender{
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (medicationNameTextField.text.length>0 && purposeTextField.text.length>0 && instructionsTextField.text.length>0)
    {
        TSMAppDelegate *appDelegate = (TSMAppDelegate *)[[UIApplication sharedApplication] delegate];
        success= [appDelegate saveMedication:medicationNameTextField.text purpose:purposeTextField.text instructions:instructionsTextField.text frequency:self.frequency date:self.startDate];
    }
    
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

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 6;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.frequencyArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %d", row);
    switch(row)
    {
            
        case 0:
            self.frequency= 0;
            break;
        case 1:
           self.frequency= 1;
            break;
        case 2:
            self.frequency= 2;
            break;
        case 3:
            self.frequency= 3;
            break;
        case 4:
            self.frequency= 4;
            break;
        case 5:
           self.frequency= 5;
            break;
    }
}

@end
