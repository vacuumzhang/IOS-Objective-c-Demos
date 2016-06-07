//
//  AddCourseViewController.m
//  CoreDataTableView
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "AddCourseViewController.h"

@interface AddCourseViewController ()

@end

@implementation AddCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleField.text = [self.currentCourse title];
    _authorField.text = [self.currentCourse author];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    _dateField.text = [dateFormat stringFromDate:[self.currentCourse releaseDate]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    //dismiss and remove the object
    [self.delegate addCourseViewControllerDidCancel:[self currentCourse]];
}

- (IBAction)save:(id)sender {
    //dismiss and save the context
    [self.currentCourse setTitle:_titleField.text];
    [self.currentCourse setAuthor:_authorField.text];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    [self.currentCourse setReleaseDate:[dateFormat dateFromString:_dateField.text]];
    [self.delegate addCourseViewControllerDidSave];
}
@end
