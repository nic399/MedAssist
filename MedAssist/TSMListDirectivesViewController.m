//
//  TSMListDirectives.m
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMListDirectivesViewController.h"
#import "TSMAppDelegate.h"
#import "TSMDirective.h"

@implementation TSMListDirectivesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    //[self displayDirectives];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayDirectives];
}

-(void) displayDirectives
{
    BOOL success=YES;
    NSString *alertString = @"Data Selection failed";
    TSMAppDelegate *appDelegate = (TSMAppDelegate *)[[UIApplication sharedApplication] delegate];
    _directivesArray= [appDelegate findDirectives];
    if (_directivesArray[0]==NULL)
    {
        success=NO;
    }
    
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_directivesArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)number
{
    // Number of rows is the number of time zones in the region for the specified section.
    
    return 4;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    TSMDirective *directive = [_directivesArray objectAtIndex:section];
    return directive.name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
   
    
    TSMDirective *directive = [_directivesArray objectAtIndex:indexPath.section];
    cell.textLabel.text = directive.name;
    return cell;
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


@end
