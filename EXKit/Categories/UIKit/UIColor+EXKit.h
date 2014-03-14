// UIColor+EXKit.h
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

#import <UIKit/UIKit.h>

UIKIT_STATIC_INLINE UIColor *
__UIColorMake(UInt8 r, UInt8 g, UInt8 b, CGFloat a)
{
    return [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a];
}
#define UIColorMake(r, g, b, a) __UIColorMake((r), (g), (b), (a))

@interface UIColor (EXKit)
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRed8bits:(UInt8)red green8bits:(UInt8)green blue8bits:(UInt8)blue alpha:(CGFloat)alpha;
@end

@interface UIColor (Flatten)
+ (UIColor *)turquoiseColor;
+ (UIColor *)emerlandColor;
+ (UIColor *)peterRiverColor;
+ (UIColor *)amethystColor;
+ (UIColor *)wetAsphaltColor;
+ (UIColor *)greenSeaColor;
+ (UIColor *)nephritisColor;
+ (UIColor *)belizeHoleColor;
+ (UIColor *)wisteriaColor;
+ (UIColor *)midnightBlueColor;
+ (UIColor *)sunFlowerColor;
+ (UIColor *)carrotColor;
+ (UIColor *)alizarinColor;
+ (UIColor *)cloudsColor;
+ (UIColor *)concreteColor;
+ (UIColor *)navelOrangeColor;
+ (UIColor *)pumpkinColor;
+ (UIColor *)pomegranateColor;
+ (UIColor *)silverColor;
+ (UIColor *)asbestosColor;
@end
