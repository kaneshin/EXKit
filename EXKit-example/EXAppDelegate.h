//
//  EXAppDelegate.h
//  EXKit
//
//  Created by Shintaro Kaneko on 2/27/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
