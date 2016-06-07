//
//  DisplayEditViewController.h
//  CoreDataTableView
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface DisplayEditViewController : UIViewController

@property (strong, nonatomic) Course * currentCourse;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *authorField;
@property (strong, nonatomic) IBOutlet UITextField *dataField;

@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;

- (IBAction)startEditing:(id)sender;
- (IBAction)doneEditing:(id)sender;

@end
