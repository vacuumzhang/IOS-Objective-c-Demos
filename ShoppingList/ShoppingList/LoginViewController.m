//
//  LoginViewController.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//login check username and password, if not alert
-(IBAction)LoginButton:(id)sender{
    NSArray *data = [[DBManager getSharedInstance]findByUsername:
                     UsernameTextField.text];
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Please check the username and password!" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        UsernameTextField.text =@"";
        PwdTextField.text = @"";
    }
    else{
        if (PwdTextField.text == [data objectAtIndex:1]) {
            NSLog(@"Login in for %@ \n", UsernameTextField.text);
            //find segue with id "loginSussed", and jump to next view
            [self performSegueWithIdentifier:@"loginSussed" sender:self];
        }
        
    }
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
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
