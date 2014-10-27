//
//  TSMHomePageViewController.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "TSMMenuItemViewController.h"

@interface TSMHomePageViewController : UIViewController<MFMailComposeViewControllerDelegate> {
MFMailComposeViewController *mailComposer;
}

@property TSMDBManager* dbManager;
- (IBAction)unwindToHome:(UIStoryboardSegue *)segue;
- (IBAction)callEmergency:(id)sender;
- (void)sendMail;

@end
