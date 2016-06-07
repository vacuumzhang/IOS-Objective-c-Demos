//
//  CourseTableViewController.m
//  CoreDataDemo
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "CourseTableViewController.h"
#import "AppDelegate.h"
#import "Course.h" 
#import "CourseViewController.h"

@interface CourseTableViewController ()

@end

@implementation CourseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)configureFech{
    //cdh = core data helper
    AppDelegate *cdh = (AppDelegate *) [[UIApplication sharedApplication]delegate];
}


@end
