//
//  DBManager.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "DBManager.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

//declear the DB
+(DBManager*)getSharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
//    NSLog(sharedInstance);
    return sharedInstance;
}

-(bool)createDB{
    BOOL isSuccess = YES;
    NSString *docsDir;
    NSArray *dirPaths;
    NSFileManager *fileMgr= [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    databasePath = ([[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"myshoplist.db"]]);
    NSLog(@"%@", databasePath);
    
    if (![fileMgr fileExistsAtPath:databasePath]) {
        
        const char *dbpath= [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database)== SQLITE_OK) {
            
            char *err;
            const char *query= "create table if not exists users (id integer primary key autoincrement, username text unique, password text)";
            const char *drinksQuery= "create table if not exists items (id integer primary key autoincrement, username text, name text, count text)";
            if (sqlite3_exec(database, query, NULL, NULL,&err) != SQLITE_OK){
                isSuccess=NO;
            }
            
            if (sqlite3_exec(database, drinksQuery, NULL, NULL,&err) != SQLITE_OK){
                isSuccess=NO;
            }
            
            sqlite3_close(database);
            NSLog(@"success crate db");
            return isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"failed to open/create database");
        }
    }
    
    return isSuccess;
}



-(BOOL)saveData:(NSString *)username :(NSString *)password{
    char *err;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into users (username, password) values (\"%@\",\"%@\")", username, password];
        const char *insert_query = [insertSQL UTF8String];
        if(sqlite3_exec(database, insert_query, NULL, NULL, &err)==SQLITE_OK){
            
            NSLog(@"create success");
            sqlite3_reset(statement);
            return YES;
        }
        else {
            NSLog(@"create failure1");
            sqlite3_reset(statement);
            return NO;
        }
        
    }
    
    return NO;
    
}


-(BOOL)addItem:(NSString *)itemName :(NSString *)count{
    char *err;
    const char *dbpath = [databasePath UTF8String];
    NSLog(@"dbpath");
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSLog(@"sqlite3_open");
        
//        
//        NSString *insertSQL = [NSString stringWithFormat:@"insert into items (username, name, count) values (\"%@\", \"%@\", \"%@\")",username, itemName, count];
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into items (name, count) values (\"%@\",\"%@\")", itemName, count];
        NSLog(@"%@\n", insertSQL);
        const char *insert_query = [insertSQL UTF8String];
        NSLog(@"insert_query");
        if(sqlite3_exec(database, insert_query, NULL, NULL, &err)==SQLITE_OK){
            NSLog(@"create success");
            sqlite3_reset(statement);
            return YES;
        }
        else {
            NSLog(@"item not add");
            sqlite3_reset(statement);
            return NO;
        }
        
    }
    
    return NO;
}

//return query who stored all info in an array by passing username.
- (NSArray*) findByUsername:(NSString *)username
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"select username, password from users where username=\"%@\"",username];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *username = [[NSString alloc] initWithUTF8String:
                                      (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:username];
                NSString *pwd = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:pwd];
                
                return resultArray;
            }
            else{
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_reset(statement);
        }
    }
    
    return nil;
}

- (NSArray*) getItemLists
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"select * from items"];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                char *nameField = (char *) sqlite3_column_text(statement, 2);
                NSString *name = [[NSString alloc]initWithUTF8String:nameField];
                [resultArray addObject:name];
            }
            
            sqlite3_reset(statement);
            return resultArray;
        }
        
    }
    return nil;
}






@end
