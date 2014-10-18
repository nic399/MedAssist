//
//  TSMPrescriptionsListViewController.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-16.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMPrescriptionsListViewController.h"
#import "TSMPrescriptionsTableViewCell.h"

@interface TSMPrescriptionsListViewController ()

@end

@implementation TSMPrescriptionsListViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NEED METHOD TO GIVE NUMBER OF PRESCRIPTIONS IN LIST
    long NUMBER_OF_ROWS = 10;
    
    TSMPrescriptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    cell.firstLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.secondLabel.text = [NSString stringWithFormat:@"%ld", NUMBER_OF_ROWS - indexPath.row];
    
    return cell;
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
    // Do any additional setup after loading the view.
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

@end
