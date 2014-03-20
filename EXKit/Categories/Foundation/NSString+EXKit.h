// NSString+EXKit.h
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

#import <Foundation/Foundation.h>

NS_INLINE BOOL
__NSStringIsValid(NSString *aString) {
    // At First, evaluate `NSNull' not to call an non-recognize selector like `isEqualToString:'.
    if ([aString isEqual:[NSNull null]]) {
        return YES;
    }
    if ([aString isEqualToString:@""]) {
        return YES;
    }
    if (aString == nil) {
        return YES;
    }
    return NO;
}
#define NSStringIsValid __NSStringIsValid

@interface NSString (EXKit)
@end