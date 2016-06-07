//
//  Item.h
//  ShoppingList
//
//  Created by Ruiyong.Z on 5/25/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *countNumber;

- (id)initWithName:(NSString *)brandName countNumber:(NSString *)countNumber;
- (id)initWithName:(NSString *)brandName;

@end
