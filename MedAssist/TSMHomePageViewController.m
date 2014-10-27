//
//  TSMHomePageViewController.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMHomePageViewController.h"
#import "TSMAppDelegate.h"
#import "TSMDBManager.h"

@interface TSMHomePageViewController ()

@end

@implementation TSMHomePageViewController

- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue
{

}

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
    
    // Check database for last email sent date
    
    // void sendMail();
    // NSDate *lastEmail = **** get last email date from database ****
    // NSTimeInterval timeSinceLastEmail = [date timeIntervalSinceNow];
    // if(timeSinceLastEmail<=-72576000){
    //    sendMail();
    // }
    
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

- (void)sendMail
{
    mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Your MedAssist Data"];
    [mailComposer setMessageBody:@"Once Data entered, it will be here" isHTML:NO];
     NSArray *toRecipients = [NSArray arrayWithObjects:@"firstMail@example.com", nil];
    [mailComposer setToRecipients:toRecipients];
     [self presentViewController:mailComposer animated:YES completion:nil];
    
    // Update last email sent date in database
}
     
#pragma mark - mail compose delegate
     -(void)mailComposeController:(MFMailComposeViewController *)controller
             didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
                 if (result) {
                     NSLog(@"Result : %d",result);
                 }
                 if (error) {
                     NSLog(@"Error : %@",error);
                 }
                 [self presentViewController:mailComposer animated:YES completion:nil];
                 
             }

@end
