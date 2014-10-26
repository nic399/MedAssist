//
//  DBManager.m
//  MedAssist
//
//  Created by Jass on 2014-10-12.

#import <Foundation/Foundation.h>
#import "TSMDBManager.h"
static TSMDBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation TSMDBManager

+(TSMDBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"MedAssist.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errorMsg;
            
            //Users Table with userId and userName
            const char *usersTable_sql_stmt =
            "create table if not exists user (userId integer PRIMARY KEY, userName text)";
            isSuccess=[self createTableHelper:usersTable_sql_stmt errMsg:errorMsg];
            
            //Notes Table
            const char *notesTable_sql_stmt =
            "create table if not exists notes (noteId integer PRIMARY KEY, noteName text, createdTime datetime, lastModified datetime, noteContent text, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:notesTable_sql_stmt errMsg:errorMsg];
            
            //Measurements Table
            const char *measurementsTable_sql_stmt =
            "create table if not exists measurements (measurementId integer PRIMARY KEY, measurementType text, measurementTime datetime, measurementValue float, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:measurementsTable_sql_stmt errMsg:errorMsg];
            
            //Appointments Table
            const char *appointmentsTable_sql_stmt =
            "create table if not exists appointments (appointmentId integer PRIMARY KEY, appointmentName text, type text, place text, dayTime datetime, specialInstructions blob, recurrence bool, recurrenceId integer,userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:appointmentsTable_sql_stmt errMsg:errorMsg];
            
            //Prescriptions Table
            const char *prescriptionsTable_sql_stmt =
            "create table if not exists prescriptions (prescriptionId integer PRIMARY KEY, prescriptionName text, purpose blob, specialInstructions blob, frequency int, time datetime, end_date datetime, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:prescriptionsTable_sql_stmt errMsg:errorMsg];
            
            //Allergies Table
            const char  *allergiesTable_sql_stmt =
            "create table if not exists allergies (allergyId integer PRIMARY KEY, allergyName text, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:allergiesTable_sql_stmt errMsg:errorMsg];
            
            //Vaccinations Table
            const char  *vaccinationsTable_sql_stmt =
            "create table if not exists vaccinations (vaccinationId integer PRIMARY KEY, vaccinationName text, vaccinationTime datetime, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:vaccinationsTable_sql_stmt errMsg:errorMsg];
            
            //Contacts Table
            const char *contactsTable_sql_stmt = "create table if not exists contacts (contactId integer PRIMARY KEY, contactName text, contactAddress text, contactType text, contactNumber integer, userId integer, FOREIGN KEY userId REFERENCES user(userId))";
            isSuccess=[self createTableHelper:contactsTable_sql_stmt errMsg:errorMsg];
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

-(BOOL) createTableHelper:(const char*) sql_stmt errMsg:(char *) errMsg;
{
    BOOL isSuccess = YES;
    if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
        != SQLITE_OK)
    {
        isSuccess = NO;
        NSLog(@"Failed to create table user");
    }
    sqlite3_close(database);
    return  isSuccess;
}

- (BOOL) saveUser:(NSString *)userName userId:(int64_t)userId;
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into user (userId,userName) values (\"%lld\",\"%@\")",userId,userName];
                                const char *insert_stmt = [insertSQL UTF8String];
                                sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
                                if (sqlite3_step(statement) == SQLITE_DONE)
                                {
                                    return YES;
                                }
                                else {
                                    return NO;
                                }
                                //sqlite3_reset(statement);
    }
                                return NO;
    
}

- (NSArray*) findByUserName:(NSString*)userName;
        {
            int64_t userId=0;
            const char *dbpath = [databasePath UTF8String];
            if (sqlite3_open(dbpath, &database) == SQLITE_OK)
            {
                NSString *getUserIdQuerySQL = [NSString stringWithFormat:
                                      @"select userId from users where userName=\"%@\"",userName];
                
                const char *query_stmt = [getUserIdQuerySQL UTF8String];
                
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK)
                {
                    if (sqlite3_step(statement) == SQLITE_ROW)
                    {
                        NSString* userIdString = [[NSString alloc] initWithUTF8String:
                                           (const char *) sqlite3_column_int64 (statement, 0)];
                        userId=[userIdString intValue];
                                            }
                    else{
                        NSLog(@"Not found");
                        return nil;
                    }
                    //sqlite3_reset(statement);
                }

                //TODO: Store the results in class objects
                NSString *getAllergiesQuerySQL = [NSString stringWithFormat:
                                      @"select * from allergies where userId=\"%lld\"",userId];
                NSArray* getAllergyList=[self getResult:getAllergiesQuerySQL ];
                
                NSString *getVaccinationsQuerySQL = [NSString stringWithFormat:
                                      @"select * from vaccinations where userId=\"%lld\"",userId];
                NSArray* getVaccinationsList=[self getResult:getVaccinationsQuerySQL ];
                
                NSString *getPrescriptionsQuerySQL = [NSString stringWithFormat:
                                      @"select * from prescriptions where userId=\"%lld\"",userId];
                NSArray* getPrescriptions=[self getResult:getPrescriptionsQuerySQL ];
                
                NSString* getAppointmentsQuerySQL = [NSString stringWithFormat:
                                      @"select * from appointments where userId=\"%lld\"",userId];
                NSArray* getAppointments=[self getResult:getAppointmentsQuerySQL ];
                
                NSString *getNotesQuerySQL = [NSString stringWithFormat:
                                      @"select * from notes where userId=\"%lld\"",userId];
                NSArray* getNotes=[self getResult:getNotesQuerySQL ];
                
                NSString *getMeasurementsQuerySQL = [NSString stringWithFormat:
                                      @"select * from measurements where userId=\"%lld\"",userId];
                NSArray* getMeasurements=[self getResult:getMeasurementsQuerySQL ];
                
            }
            return nil;
        }

-(NSArray*) getResult:(NSString*) query;
{
    //TO DO: GOT THIS FROM http://www.appcoda.com/sqlite-database-ios-app-tutorial/
    //Need to customize for our classes when we have them ready
    const char *query_stmt = [query UTF8String];
    // Initialize the results array.
    if (self.arrResults != nil) {
        [self.arrResults removeAllObjects];
        self.arrResults = nil;
    }
    self.arrResults = [[NSMutableArray alloc] init];
    
    // Initialize the column names array.
    if (self.arrColumnNames != nil) {
        [self.arrColumnNames removeAllObjects];
        self.arrColumnNames = nil;
    }
    self.arrColumnNames = [[NSMutableArray alloc] init];
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    if (sqlite3_prepare_v2(database,
                           query_stmt, -1, &statement, NULL) == SQLITE_OK)
    {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            // Initialize the mutable array that will contain the data of a fetched row.
            
            // Get the total number of columns.
            int totalColumns = sqlite3_column_count(statement);
            
            // Go through all columns and fetch each column data.
            for (int i=0; i<totalColumns; i++){
                // Convert the column data to text (characters).
                char *dbDataAsChars = (char *)sqlite3_column_text(statement, i);
                
                // If there are contents in the currenct column (field) then add them to the current row array.
                if (dbDataAsChars != NULL) {
                    // Convert the characters to string.
                    [resultArray addObject:[NSString  stringWithUTF8String:dbDataAsChars]];
                }
                
                // Keep the current column name.
                if (self.arrColumnNames.count != totalColumns) {
                    dbDataAsChars = (char *)sqlite3_column_name(statement, i);
                    [self.arrColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
                }
            }
            
            // Store each fetched data row in the results array, but first check if there is actually data.
            if (_arrDataRow.count > 0) {
                [self.arrResults addObject:_arrDataRow];
            }
            return resultArray;
            
        }
    
        else{
            NSLog(@"Not found");
            return nil;
        }
        //sqlite3_reset(statement);
    }
    
    return nil;
}
@end
