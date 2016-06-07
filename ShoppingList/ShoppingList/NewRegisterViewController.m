//
//  NewRegisterViewController.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "NewRegisterViewController.h"

@interface NewRegisterViewController ()

@end

@implementation NewRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//click register button if ture save username and passowrd text fields in DB.
- (IBAction)RegisterButton:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (_UsernameTextField.text.length>0 && _PasswordTextField.text.length>0){
        success = [[DBManager getSharedInstance]saveData:
                   _UsernameTextField.text : _PasswordTextField.text];
//        [[DBManager getSharedInstance]addItem:@"mac" :@"1"];
        if(success != NO){
            NSLog(@"Save success");
        }
    } else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: alertString message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
