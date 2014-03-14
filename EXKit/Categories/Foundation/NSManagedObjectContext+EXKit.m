// NSManagedObjectContext+EXKit.m
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

#import "NSManagedObjectContext+EXKit.h"

static NSString *const EXKit_NSManagedObjectContextThreadKey = @"NSManagedObjectContext+EXKit.h NSManagedObjectContextThreadKey";

@implementation NSManagedObjectContext (EXKit)

+ (NSManagedObjectContext *)managedObjectContextForThread:(NSThread *)thread
{
    NSMutableDictionary *threadDictionary = [thread threadDictionary];
    NSManagedObjectContext *context = [threadDictionary objectForKey:EXKit_NSManagedObjectContextThreadKey];
    
    if (!context) {
        id appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *mainContext = [appDelegate managedObjectContext];
        if ([[NSThread currentThread] isMainThread]) {
            context = mainContext;
        } else {
            context = [[NSManagedObjectContext alloc] init];
            [context setPersistentStoreCoordinator:[mainContext persistentStoreCoordinator]];
        }
        [threadDictionary setObject:context forKey:EXKit_NSManagedObjectContextThreadKey];
    }
    
    return context;
}

+ (NSManagedObjectContext *)managedObjectContextForCurrentThread
{
    return [NSManagedObjectContext managedObjectContextForThread:[NSThread currentThread]];
}

+ (NSManagedObjectContext *)managedObjectContextForMainThread
{
    return [NSManagedObjectContext managedObjectContextForThread:[NSThread mainThread]];
}

+ (BOOL)save:(NSError **)error
{
    NSManagedObjectContext *context = [NSManagedObjectContext managedObjectContextForCurrentThread];
    BOOL isMainThread = [[NSThread currentThread] isMainThread];
    
    if (context == nil || ![context hasChanges]) {
        return YES;
    }
    
    if (!isMainThread) {
        NSManagedObjectContext *mainContext = [NSManagedObjectContext managedObjectContextForMainThread];
        [mainContext performSelectorOnMainThread:@selector(mergeChangesFromContextDidSaveNotification:)
                                      withObject:context
                                   waitUntilDone:YES];
    }
    
    return [context save:error];
}

@end