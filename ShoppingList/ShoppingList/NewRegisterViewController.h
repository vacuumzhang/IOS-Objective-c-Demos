//
//  NewRegisterViewController.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/26/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface NewRegisterViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *UsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;
- (IBAction)RegisterButton:(id)sender;

@end
