//
//  AddItemViewController.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
@interface AddItemViewController : UIViewController


@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemCount;
@property (nonatomic, strong) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *count;
- (IBAction)SaveButton:(id)sender;

@end
