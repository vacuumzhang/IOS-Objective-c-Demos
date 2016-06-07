//
//  DetailViewController.h
//  CoreDataTest
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

