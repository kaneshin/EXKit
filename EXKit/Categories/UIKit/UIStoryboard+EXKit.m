//
//  UIStoryboard+EXKit.m
//  EXKit
//
//  Created by Shintaro Kaneko on 3/14/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import "UIStoryboard+EXKit.h"

@implementation UIStoryboard (EXKit)

+ (instancetype)mainStoryboard
{
   return [[self class] storyboardWithName:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"UIMainStoryboardFile"]];
}

+ (instancetype)storyboardWithName:(NSString *)name
{
    return [[self class] storyboardWithName:name bundle:[NSBundle mainBundle]];
}

@end
