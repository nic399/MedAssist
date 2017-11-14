//
//  TSMAppDelegate.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-13.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMAppDelegate.h"
#import "TSMDBManager.h"
#import "TSMDirective.h"
#import "TSMAllergy.h"
#import "TSMMedication.h"
#import "TSMProfile.h"
@implementation TSMAppDelegate
sqlite3 * database;
sqlite3_stmt* statement;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Setup some globals
	databaseName = @"MedAssist.sql";
	
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
    [self createDB];
    return YES;
}
-(void)createDB{
    BOOL success;
    // Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
	
	// If the database already exists then return without doing anything
	if(success) return;
	
	// If not then proceed to copy the database from the application to the users filesystem
	
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
	
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	
	//[fileManager release];
    
    
    
            
        }


-(BOOL) saveUser:(NSString*)userName firstName:(NSString *)userFirstName lastName:(NSString *)userLastName hashedPass:(NSString *)hashedPass userEmail:(NSString *)userEmail gender:(NSString *)userGender hashedCarecard:(NSString *)hashedCarecard hashedInsurance1:(NSString *)hashedInsurance1 hashedInsurance2:(NSString *)hashedInsurance2 hashedInsurance3:(NSString *)hashedInsurance3 hashedInsurance4:(NSString *)hashedInsurance4 userId:(int64_t)userId;
{
  
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into user (userId,userName,firstName,lastName,hashedPass,userEmail,gender,hashedCarecard,hashedInsurance1,hashedInsurance2,hashedInsurance3,hashedInsurance4) values (\"%lld\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",userId,userName,userFirstName,userLastName,hashedPass,userEmail,userGender,hashedCarecard,hashedInsurance1,hashedInsurance2,hashedInsurance3,hashedInsurance4];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    
    return NO;
    
}

- (BOOL) saveAllergy:(NSString* )allergyName severity:(NSString*)severity effects:(NSString*)effects;
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into allergies (allergyName , effects , severity , userId) values (\"%@\",\"%@\", \"%@\",\"%d\")", allergyName, effects, severity, 100];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}

- (BOOL) saveMedication:(NSString*)medicationName purpose:(NSString*)purpose instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into medications (medicationName, purpose, specialInstructions, frequency, time, userId) values (\"%@\",\"%@\", \"%@\",\"%ld\", \"%@\", \"%d\")", medicationName, purpose, instructions,(long)frequency, date, 100];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}

- (BOOL) saveDirective:(NSString* )directiveName instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSLog(directiveName);
        NSLog(instructions);
        NSLog(date);
        NSString *insertSQL = [NSString stringWithFormat:@"insert into directives (directiveName, specialInstructions, frequency, time, userId) values (\"%@\",\"%@\",\"%ld\",\"%@\", \"%d\")", directiveName, instructions,(long)frequency,date, 100];
        const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL)==SQLITE_OK)
        {
            NSLog(@"OKS");
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                return YES;
            }
            else {
                return NO;
            }
        }
        sqlite3_reset(statement);
    }
    return NO;
}

- (NSMutableArray*) retriveProfile
{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    _profileInfo=[[NSMutableArray alloc] init];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECTuserName,firstName,lastName,hashedPass,userEmail,gender,hashedCarecard,hashedInsurance1,hashedInsurance2,hashedInsurance3,hashedInsurance4 FROM user WHERE userid=\"%d\"", 100];
        
        const char *query_stmt = [querySQL UTF8String];
        
        while (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            TSMProfile *profile;
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                profile.userName = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 1)];
                profile.firstName = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 2)];
                profile.lastName = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 3)];
                profile.passwordHash = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 4)];
                profile.email = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 5)];
                profile.gender = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 6)];
                profile.carecard  = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 7)];
                NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                tempArray[0] = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 8)];
                tempArray[1] = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 9)];
                tempArray[2] = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 10)];
                tempArray[3] = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 11)];
                profile.healthInsuranceNumbers = [[NSMutableArray alloc] initWithArray:tempArray copyItems:TRUE];
                
                [_profileInfo addObject: profile];
            } else {
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return _profileInfo;
}

- (NSMutableArray*) findDirectives
{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    _directives=[[NSMutableArray alloc] init];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT directiveName, specialInstructions, frequency, time FROM directives WHERE userid=\"%d\"", 100];
        
        const char *query_stmt = [querySQL UTF8String];
        
        while (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            TSMDirective *directive;
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                directive.name = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                
                directive.specialInstructions = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                directive.frequency = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                NSString* time = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
                directive.time= [dateFormat dateFromString:time];
                
                [_directives addObject: directive];
            } else {
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return _directives;
}

- (NSMutableArray*) findAllergies
{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    _allergies=[[NSMutableArray alloc] init];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT allergyName, effects, severity FROM allergies WHERE userid=\"%d\"", 100];
        
        const char *query_stmt = [querySQL UTF8String];
        
        while (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) ==SQLITE_OK)
        {
            TSMAllergy *allergy;
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                allergy.name = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                
                allergy.effects = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                allergy.severity= [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                [_allergies addObject: allergy];
                
            }
            else {
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return _allergies;
}

- (NSMutableArray*) findMedications
{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    _medications=[[NSMutableArray alloc] init];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT medicationName, purpose, specialInstructions, frequency, time FROM medications WHERE userid=\"%d\"", 100];
        
        const char *query_stmt = [querySQL UTF8String];
        
        while (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            TSMMedication *medication;
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                medication.name = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                
                medication.specialInstructions = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                medication.frequency = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                
                NSString* time = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
                medication.time= [dateFormat dateFromString:time];
                
                [_medications addObject: medication];
                
            } else {
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return _medications;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
