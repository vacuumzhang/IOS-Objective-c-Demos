//
//  ViewController.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *items;

- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)done:(UIStoryboardSegue *)segue;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialiser the ites NSMutableArray
//    Item *item1 = [[Item alloc] initWithName:@"Coke" countNumber:@"1"];
//    Item *item2 = [[Item alloc] initWithName:@"Milk" countNumber:@"1"];
//    Item *item3 = [[Item alloc] initWithName:@"Rice" countNumber:@"1"];
    
//    self.items = [[NSMutableArray alloc] init];
//    self.items = [NSMutableArray arrayWithObjects:item1,item2,item3, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
}

//done segue form AdditemVC, reload the items array
- (IBAction)done:(UIStoryboardSegue *)segue
{
    AddItemViewController *addItemVC = segue.sourceViewController;
//    Item *item = [[Item alloc] initWithName:addItemVC.itemName countNumber:addItemVC.itemCount];
//    [self.items addObject:item];
//    
//    [[DBManager getSharedInstance]addItem:addItemVC.itemName :addItemVC.itemCount];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

//set number of the tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


//set row by items array size
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[DBManager getSharedInstance] getItemLists] count];
    
}


//passing vlue to cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ItemCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[DBManager getSharedInstance] getItemLists][indexPath.row];
//    
//    cell.textLabel.text = currentItem.brandName;
//    cell.detailTextLabel.text = currentItem.countNumber;
//    
    return cell;
}

//swip the cell get delete button
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
//    return UITableViewCellEditingStyleDelete;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.items removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from items array.
        [self.items removeObjectAtIndex:indexPath.row];
        [tableView reloadData]; // cell table to refresh now
    }
}

@end
