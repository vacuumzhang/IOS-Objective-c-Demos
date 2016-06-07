//
//  Item.m
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "Item.h"

@implementation Item

//init object
- (id)initWithName:(NSString *)brandName countNumber:(NSString *)countNumber {
    self = [super init];
    
    if (self) {
        _brandName = brandName;
        _countNumber = countNumber;
    }
    
    return self;
}

- (id)initWithName:(NSString *)brandName {
    self = [super init];
    
    if (self) {
        _brandName = brandName;
    }
    
    return self;
}

@end
