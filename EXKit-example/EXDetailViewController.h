//
//  EXDetailViewController.h
//  EXKit
//
//  Created by Shintaro Kaneko on 2/27/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
