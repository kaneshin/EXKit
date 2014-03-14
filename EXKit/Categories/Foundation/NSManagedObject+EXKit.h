// NSManagedObject+EXKit.h
//
// Copyright (c) 2014 Shintaro Kaneko (http://kaneshinth.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <CoreData/CoreData.h>

@interface NSManagedObject (EXKit)

/**
 Find objects
 
 @param entityName
 @param sortDescriptors
 @param predicate
 @param fetchLimit
 @param thread
 */
+ (NSArray *)findWithEntityName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors predicate:(NSPredicate *)predicate fetchLimit:(NSUInteger)fetchLimit forThread:(NSThread *)thread;
+ (NSArray *)findWithEntityName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors predicate:(NSPredicate *)predicate fetchLimit:(NSUInteger)fetchLimit;

/**
 Finds the object by ObjectID on thread.
 
 @param objectID
 @param thread
 */
+ (instancetype)findByObjectID:(NSManagedObjectID *)objectID forThread:(NSThread *)thread;
+ (instancetype)findByObjectID:(NSManagedObjectID *)objectID;


/**
 Inserts the object of entityName on thread.
 
 @param entityName
 @param thread
 */
+ (instancetype)insertIntoContextWithEntityName:(NSString *)entityName forThread:(NSThread *)thread;
+ (instancetype)insertIntoContextWithEntityName:(NSString *)entityName;


/**
 Counts the number of object with entityName on thread.
 
 @param entityName
 @param predicate
 @param thread
 */
+ (NSUInteger)countWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate forThread:(NSThread *)thread;
+ (NSUInteger)countWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate;
+ (NSUInteger)countWithEntityName:(NSString *)entityName forThread:(NSThread *)thread;
+ (NSUInteger)countWithEntityName:(NSString *)entityName;


/**
 Deletes the object by ObjectID on thread.
 
 @param objectID
 @param thread
 */
+ (BOOL)deleteByObjectID:(NSManagedObjectID *)objectID forThread:(NSThread *)thread;
+ (BOOL)deleteByObjectID:(NSManagedObjectID *)objectID;


/**
 Delete All Objects of entityName on thread.
 
 @param entityName
 @param thread
 */
+ (void)deleteAllObjectsWithEntityName:(NSString *)entityName forThread:(NSThread *)thread;
+ (void)deleteAllObjectsWithEntityName:(NSString *)entityName;

@end
