//
//  ViewController.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"
#import "DBManager.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString* username;


@end

