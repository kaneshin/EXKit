//
//  NSMutableArray+EXKit.m
//  EXKit
//
//  Created by Shintaro Kaneko on 3/8/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import "NSMutableArray+EXKit.h"

@implementation NSMutableArray (EXKit)
- (id)dequeue
{
    NSAssert(self.count, @"The array does not contain anything.");
    id obj = [self objectAtIndex:0];
    if (obj != nil) {
        [self removeObjectAtIndex:0];
    }
    return obj;
}

- (void)enqueue:(id)anObject
{
    [self addObject:anObject];
}
@end
