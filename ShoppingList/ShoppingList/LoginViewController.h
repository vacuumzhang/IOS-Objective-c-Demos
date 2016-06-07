//
//  LoginViewController.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface LoginViewController : ViewController

{
    
    IBOutlet UITextField *UsernameTextField;
    IBOutlet UITextField *PwdTextField;
    
}

- (IBAction)LoginButton:(id)sender;

@end
