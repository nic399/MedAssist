//
//  TSMHomePageViewController.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMMenuItemViewController.h"
#import "TSMDBManager.h"
@interface TSMHomePageViewController : UIViewController

@property TSMDBManager* dbManager;
- (IBAction)unwindToHome:(UIStoryboardSegue *)segue;

@end
