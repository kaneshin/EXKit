//
//  EXMasterViewController.h
//  EXKit
//
//  Created by Shintaro Kaneko on 2/27/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface EXMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
