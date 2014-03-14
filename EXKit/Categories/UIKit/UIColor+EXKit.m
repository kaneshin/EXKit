// UIColor+EXKit.m
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

#import "UIColor+EXKit.h"

@implementation UIColor (EXKit)
+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [UIColor colorWithHex:hex alpha:1.f];
}

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(float)((hex & 0xFF0000) >> 16) / 255.f
                           green:(float)((hex & 0x00FF00) >> 8) / 255.f
                            blue:(float)(hex & 0x0000FF) / 255.f
                           alpha:alpha];
}

+ (UIColor *)colorWithRed8bits:(UInt8)red green8bits:(UInt8)green blue8bits:(UInt8)blue alpha:(CGFloat)alpha
{
    return UIColorMake(red, green, blue, alpha);
}
@end

@implementation UIColor (Flatten)
+ (UIColor *)turquoiseColor
{
    return [UIColor colorWithRed8bits:26.f green8bits:188.f blue8bits:156.f alpha:1.f];
}

+ (UIColor *)emerlandColor
{
    return [UIColor colorWithRed8bits:46.f green8bits:204.f blue8bits:113.f alpha:1.f];
}

+ (UIColor *)peterRiverColor
{
    return [UIColor colorWithRed8bits:52.f green8bits:152.f blue8bits:219.f alpha:1.f];
}

+ (UIColor *)amethystColor
{
    return [UIColor colorWithRed8bits:155.f green8bits:89.f blue8bits:182.f alpha:1.f];
}

+ (UIColor *)wetAsphaltColor
{
    return [UIColor colorWithRed8bits:52.f green8bits:73.f blue8bits:94.f alpha:1.f];
}

+ (UIColor *)greenSeaColor
{
    return [UIColor colorWithRed8bits:22.f green8bits:160.f blue8bits:133.f alpha:1.f];
}

+ (UIColor *)nephritisColor
{
    return [UIColor colorWithRed8bits:39.f green8bits:174.f blue8bits:96.f alpha:1.f];
}

+ (UIColor *)belizeHoleColor
{
    return [UIColor colorWithRed8bits:41.f green8bits:128.f blue8bits:185.f alpha:1.f];
}

+ (UIColor *)wisteriaColor
{
    return [UIColor colorWithRed8bits:142.f green8bits:68.f blue8bits:173.f alpha:1.f];
}

+ (UIColor *)midnightBlueColor
{
    return [UIColor colorWithRed8bits:44.f green8bits:62.f blue8bits:80.f alpha:1.f];
}

+ (UIColor *)sunFlowerColor
{
    return [UIColor colorWithRed8bits:241.f green8bits:196.f blue8bits:15.f alpha:1.f];
}

+ (UIColor *)carrotColor
{
    return [UIColor colorWithRed8bits:230.f green8bits:126.f blue8bits:34.f alpha:1.f];
}

+ (UIColor *)alizarinColor
{
    return [UIColor colorWithRed8bits:231.f green8bits:76.f blue8bits:60.f alpha:1.f];
}

+ (UIColor *)cloudsColor
{
    return [UIColor colorWithRed8bits:236.f green8bits:240.f blue8bits:241.f alpha:1.f];
}

+ (UIColor *)concreteColor
{
    return [UIColor colorWithRed8bits:149.f green8bits:165.f blue8bits:166.f alpha:1.f];
}

+ (UIColor *)navelOrangeColor
{
    return [UIColor colorWithRed8bits:243.f green8bits:156.f blue8bits:18.f alpha:1.f];
}

+ (UIColor *)pumpkinColor
{
    return [UIColor colorWithRed8bits:211.f green8bits:84.f blue8bits:.0f alpha:1.f];
}

+ (UIColor *)pomegranateColor
{
    return [UIColor colorWithRed8bits:192.f green8bits:57.f blue8bits:43.f alpha:1.f];
}

+ (UIColor *)silverColor
{
    return [UIColor colorWithRed8bits:189.f green8bits:195.f blue8bits:199.f alpha:1.f];
}

+ (UIColor *)asbestosColor
{
    return [UIColor colorWithRed8bits:127.f green8bits:140.f blue8bits:141.f alpha:1.f];
}
@end
