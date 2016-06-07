//
//  DisplayEditViewController.m
//  CoreDataTableView
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "DisplayEditViewController.h"
#import "AppDelegate.h"

@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleField.text = [self.currentCourse title];
    _authorField.text = [self.currentCourse author];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    _dataField.text = [df stringFromDate:[self.currentCourse releaseDate]]; 
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

- (IBAction)startEditing:(id)sender {
    _titleField.enabled = YES;
    _authorField.enabled = YES;
    _dataField.enabled = YES;
    
    _titleField.borderStyle = UITextBorderStyleRoundedRect;
    _authorField.borderStyle = UITextBorderStyleRoundedRect;
    _dataField.borderStyle = UITextBorderStyleRoundedRect;
    
    _editButton.hidden = YES;
    _doneButton.hidden = NO;
    
    
}

- (IBAction)doneEditing:(id)sender {
    _titleField.enabled = NO;
    _authorField.enabled = NO;
    _dataField.enabled = NO;
    
    _titleField.borderStyle = UITextBorderStyleNone;
    _authorField.borderStyle = UITextBorderStyleNone;
    _dataField.borderStyle = UITextBorderStyleNone;
    
    _editButton.hidden = NO;
    _doneButton.hidden = YES;
    
    _currentCourse.title = _titleField.text;
    _currentCourse.author = _authorField.text;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    _currentCourse.releaseDate = [df dateFromString:_dataField.text];
    
    AppDelegate *myApp = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [myApp saveContext];
}
@end
