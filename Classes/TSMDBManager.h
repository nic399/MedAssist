//
//  DBManager.h
//  MedAssist
//
//  Created by Jass on 2014-10-12.

#ifndef MedAssist_TSMDBManager_h
#define MedAssist_TSMDBManager_h
#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface TSMDBManager : NSObject
{

    NSString *databasePath;
}

@property int32_t userId;
@property NSMutableArray *allergies;
@property NSMutableArray *medications;
@property NSMutableArray *directives;
+(TSMDBManager*)getSharedInstance;
-(BOOL)createDB; //create database, and tables
-(BOOL) saveUser:(NSString*)userName userId:(int64_t)userId;//save all input from input forms
//TO DO: need to connect to app pages (UI) and object classes
- (BOOL) saveAllergy:(NSString* )allergyName severity:(NSString*)severity effects:(NSString*)effects;
- (BOOL) saveMedication:(NSString*)medicationName purpose:(NSString*)purpose instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;
- (BOOL) saveDirective:(NSString* )directiveName instructions:(NSString*)instructions frequency:(NSInteger)frequency date:(NSString*)date;

-(BOOL) createTableHelper:(const char*) sql_stmt errMsg:(char *)errMsg;//helper called by createDB, that monitors creation of table-error if fails

- (NSMutableArray*) findDirectives;
- (NSMutableArray*) findMedications;
- (NSMutableArray*) findAllergies;

@end

#endif
