//
//  TSMAppDelegate.h
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface TSMAppDelegate : UIResponder <UIApplicationDelegate>
{
// Database variables
NSString *databaseName;
NSString *databasePath;

}

@property int32_t userId;
@property NSMutableArray *allergies;
@property NSMutableArray *medications;
@property NSMutableArray *directives;

-(void) createDB; //create database, and tables
-(BOOL) saveUser:(NSString*)userName userId:(int64_t)userId;//save all input from input forms
//TO DO: need to connect to app pages (UI) and object classes
- (BOOL) saveAllergy:(NSString* )allergyName severity:(NSString*)severity effects:(NSString*)effects;
- (BOOL) saveMedication:(NSString*)medicationName purpose:(NSString*)purpose instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;
- (BOOL) saveDirective:(NSString* )directiveName instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;


- (NSMutableArray*) findDirectives;
- (NSMutableArray*) findMedications;
- (NSMutableArray*) findAllergies;

@property (strong, nonatomic) UIWindow *window;

@end
