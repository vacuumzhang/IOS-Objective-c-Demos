//
//  CoursesTableViewController.h
//  CoreDataTableView
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AddCourseViewController.h"

@interface CoursesTableViewController : UITableViewController <AddCourseViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext * managedObjectContext;

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;

 

@end
