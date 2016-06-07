//
//  ViewController.m
//  JSONHandling
//
//  Created by Ruiyong.Z on 6/7/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://jsonplaceholder.typicode.com/albums" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
//        NSLog(@"JSON: %@", responseObject);
        self.data = responseObject;
        
        NSLog(@"data: %@", self.data);
        //print 0 no index
        NSString *index0 = [self.data objectAtIndex:0];
        NSLog(@"index 0: %@", index0);
        //print 0 no index with dic key "title"
        NSString *index0Title = [[self.data objectAtIndex:0]objectForKey:@"title"];
        NSLog(@"index 0 title: %@", index0Title);
        
        
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
