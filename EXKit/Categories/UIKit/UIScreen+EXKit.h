//
//  UIScreen+EXKit.h
//  EXKit
//
//  Created by Shintaro Kaneko on 3/14/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_STATIC_INLINE CGFloat
__UIScreenMainScreenScale()
{
    return [UIScreen mainScreen].scale;
}
#define UIScreenScale __UIScreenMainScreenScale()

UIKIT_STATIC_INLINE CGRect
__UIScreenMainScreenBounds()
{
    return [UIScreen mainScreen].bounds;
}
#define UIScreenBounds __UIScreenMainScreenBounds()

@interface UIScreen (EXKit)

@end
