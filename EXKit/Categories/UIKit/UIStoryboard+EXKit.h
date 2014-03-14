//
//  UIStoryboard+EXKit.h
//  EXKit
//
//  Created by Shintaro Kaneko on 3/14/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (EXKit)

+ (instancetype)mainStoryboard;
+ (instancetype)storyboardWithName:(NSString *)name;

@end
