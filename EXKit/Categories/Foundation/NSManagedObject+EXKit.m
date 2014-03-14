// NSManagedObject+EXKit.m
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

#import "NSManagedObject+EXKit.h"

#import "EXKitDefines.h"
#import "NSManagedObjectContext+EXKit.h"

@implementation NSManagedObject (EXKit)

#pragma mark - Find

+ (NSArray *)findWithEntityName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors predicate:(NSPredicate *)predicate fetchLimit:(NSUInteger)fetchLimit forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext]];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setFetchLimit:fetchLimit];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        EXErrorLog(error);
        return nil;
    }
    return fetchedObjects;
}

+ (NSArray *)findWithEntityName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors predicate:(NSPredicate *)predicate fetchLimit:(NSUInteger)fetchLimit
{
    return [[self class] findWithEntityName:entityName sortDescriptors:sortDescriptors predicate:predicate fetchLimit:fetchLimit forThread:[NSThread currentThread]];
}

+ (instancetype)findByObjectID:(NSManagedObjectID *)objectID forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    
    NSError *error = nil;
    id object = [managedObjectContext existingObjectWithID:objectID error:&error];
    
    if (error) {
        EXErrorLog(error);
        return nil;
    }
    return object;
}

+ (instancetype)findByObjectID:(NSManagedObjectID *)objectID
{
    return [[self class] findByObjectID:objectID forThread:[NSThread currentThread]];
}


#pragma mark - Insert

+ (instancetype)insertIntoContextWithEntityName:(NSString *)entityName forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    id object = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                              inManagedObjectContext:managedObjectContext];
    return object;
}

+ (instancetype)insertIntoContextWithEntityName:(NSString *)entityName
{
    return [[self class] insertIntoContextWithEntityName:entityName forThread:[NSThread currentThread]];
}

#pragma mark - Count

+ (NSUInteger)countWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext]];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSUInteger count = [managedObjectContext countForFetchRequest:fetchRequest error:&error];
    
    if (error) {
        EXErrorLog(error);
        count = 0;
    }
    return count;
}

+ (NSUInteger)countWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate
{
    return [[self class] countWithEntityName:entityName predicate:predicate forThread:[NSThread currentThread]];
}

+ (NSUInteger)countWithEntityName:(NSString *)entityName forThread:(NSThread *)thread
{
    return [[self class] countWithEntityName:entityName predicate:nil forThread:thread];
}

+ (NSUInteger)countWithEntityName:(NSString *)entityName
{
    return [[self class] countWithEntityName:entityName predicate:nil forThread:[NSThread currentThread]];
}

#pragma mark - Delete

+ (BOOL)deleteByObjectID:(NSManagedObjectID *)objectID forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    
    NSError *error = nil;
    id object = [managedObjectContext existingObjectWithID:objectID error:&error];
    
    if (error) {
        EXErrorLog(error);
        return NO;
    }
    [managedObjectContext deleteObject:object];
    return YES;
}

+ (BOOL)deleteByObjectID:(NSManagedObjectID *)objectID
{
    return [[self class] deleteByObjectID:objectID forThread:[NSThread currentThread]];
}

+ (void)deleteAllObjectsWithEntityName:(NSString *)entityName forThread:(NSThread *)thread
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContextForThread:thread];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!error) {
        [fetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [managedObjectContext deleteObject:obj];
        }];
        NSError *error = nil;
        if (![managedObjectContext save:&error]) {
            EXErrorLog(error);
        }
    } else {
        EXErrorLog(error);
    }
}

+ (void)deleteAllObjectsWithEntityName:(NSString *)entityName
{
    [[self class] deleteAllObjectsWithEntityName:entityName forThread:[NSThread currentThread]];
}

@end
