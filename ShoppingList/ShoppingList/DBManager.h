//
//  DBManager.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL) saveData:(NSString*)username :(NSString*)pwd;
-(NSArray*) findByUsername:(NSString*)username;
-(BOOL)addItem: (NSString *)itemName
              : (NSString *)count;
- (NSArray*) getItemLists;

@end
