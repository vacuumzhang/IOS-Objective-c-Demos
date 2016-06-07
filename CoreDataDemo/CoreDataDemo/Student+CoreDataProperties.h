//
//  Student+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by Ruiyong.Z on 6/4/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstname;
@property (nullable, nonatomic, retain) NSString *lastname;
@property (nullable, nonatomic, retain) NSString *semester;
@property (nullable, nonatomic, retain) Course *course;

@end

NS_ASSUME_NONNULL_END
