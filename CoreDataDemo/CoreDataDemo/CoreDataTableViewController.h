//
//  CoreDataTableViewController.h
//  CoreDataDemo
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic)NSFetchedResultsController * frc;

- (void)performFetch;

@end
