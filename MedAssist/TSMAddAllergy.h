//
//  TSMAddAllergy.h
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TSMDBManager.h"

@interface TSMAddAllergy : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *allergyNameTextField;
    IBOutlet UITextField *severityTextField;
    IBOutlet UITextField *effectsTextField;
}

-(IBAction)saveAllergy:(id)sender;

@end
