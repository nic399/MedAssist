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
@property NSMutableArray* arrResults;
@property NSMutableArray* arrColumnNames;
@property NSMutableArray* arrDataRow;
+(TSMDBManager*)getSharedInstance;
-(BOOL)createDB; //create database, and tables

-(BOOL) saveUser:(NSString*)userName userId:(int64_t)userId;//save all input from input forms
//TO DO: need to connect to app pages (UI) and object classes

-(NSArray*) findByUserName:(NSString*)userName;//select all data of a user
//TO DO: create objects of different classes and store information to display on app

-(BOOL) saveContact:(NSString*)contactName contactId:(int64_t)contactId contactAddress:(NSString*)contactAddress contactType:(NSString*)contactType contactNumber:(int64_t)contactNumber userId:(int64_t)userId;//save all input from contact input forms
//TO DO: need to connect to app pages (UI) and object classes

-(BOOL) saveVaccination:(NSString*)vaccinationName vaccinationId:(int64_t)vaccinationId vaccinationTime:(NSString*)vaccinationTime userId:(int64_t)userId;//save all input from vaccination input forms
//TO DO: need to connect to app pages (UI) and object classes

-(BOOL) saveNote:(NSString*)noteName noteId:(int64_t)noteId createdTime:(NSString*)createdTime lastModified:(NSString*)lastModified noteContent:(NSString*)noteContent userId:(int64_t)userId;//save all input from note input forms
//TO DO: need to connect to app pages (UI) and object classes

-(BOOL) saveMeasurement:(NSString*)measurementType measurementId:(int64_t)measurementId measurementTime:(NSString*)measurementTime measurementValue:(float)measurementValue userId:(int64_t)userId;//save all input from measurement input forms
//TO DO: need to connect to app pages (UI) and object classes

-(BOOL) createTableHelper:(const char*) sql_stmt errMsg:(char *)errMsg;//helper called by createDB, that monitors creation of table-error if fails

-(NSArray*) getResult:(NSString*) query;//helper called by findByUserName that executes all select queries
@end

#endif
