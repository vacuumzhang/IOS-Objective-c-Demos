//
//  AddCourseViewController.h
//  CoreDataTableView
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol AddCourseViewControllerDelegate;


@interface AddCourseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) id <AddCourseViewControllerDelegate> delegate;

@property (strong, nonatomic) Course *currentCourse;



- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end

@protocol AddCourseViewControllerDelegate <NSObject>

-(void)addCourseViewControllerDidSave;
-(void)addCourseViewControllerDidCancel:(Course *)courseToDelete;

@end