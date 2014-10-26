//
//  DBManager.m
//  MedAssist
//
//  Created by Jass on 2014-10-12.

#import <Foundation/Foundation.h>
#import "TSMDBManager.h"
#import "TSMDirective.h"
#import "TSMMedication.h"
#import "TSMAllergy.h"

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



@end
