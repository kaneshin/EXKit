//
//  NSMutableArray+EXKit.h
//  EXKit
//
//  Created by Shintaro Kaneko on 3/8/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (EXKit)
- (id)dequeue;
- (void)enqueue:(id)anObject;
@end
