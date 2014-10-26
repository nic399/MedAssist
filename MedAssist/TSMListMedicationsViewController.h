//
//  TSMListMedications.h
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMListMedicationsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *listOfMedications;
@property (weak, nonatomic) IBOutlet UITableView *listOfAllergies;

@end
