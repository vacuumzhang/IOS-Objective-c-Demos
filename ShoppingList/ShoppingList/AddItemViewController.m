//
//  AddItemViewController.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "AddItemViewController.h"
#import "Item.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

//Segue with identifier "doneSegue"
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if (_name.text.length>0 && _count.text.length>0) {
        
        if ([segue.identifier isEqualToString:@"doneSegue"]) {
            self.itemName = self.name.text;
            self.itemCount = self.count.text;
//            
//          [[DBManager getSharedInstance]addItem:_name.text :_count.text];
        }
    }
}

- (IBAction)SaveButton:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (_name.text.length>0 && _count.text.length>0){
        NSLog(@"test");
        success = [[DBManager getSharedInstance]addItem:_name.text :_count.text];
        if(success != NO){
            NSLog(@"Item save success");
        }
    } else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: alertString message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
    }
}

@end
