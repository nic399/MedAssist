//
//  TSMListDirectives.h
//  MedAssist
//
//  Created by Jas on 2014-10-19.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSMListDirectivesViewController :UIViewController //<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listOfDirectives;
@property NSMutableArray *directivesArray;
-(void) displayDirectives;
@end
