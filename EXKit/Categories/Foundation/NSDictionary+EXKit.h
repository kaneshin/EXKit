    // NSDictionary+EXKit.h
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

@interface NSDictionary (EXKit)

- (BOOL)hasKey:(NSString *)aKey;

- (NSString *)stringForKey:(NSString *)aKey default:(NSString *)defaultValue;
- (NSString *)stringForKey:(NSString *)aKey;

- (NSArray *)arrayForKey:(NSString *)aKey default:(NSArray *)defaultValue;
- (NSArray *)arrayForKey:(NSString *)aKey;

- (NSDictionary *)dictionaryForKey:(NSString *)aKey default:(NSDictionary *)defaultValue;
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;

- (NSData *)dataForKey:(NSString *)aKey default:(NSData *)defaultValue;
- (NSData *)dataForKey:(NSString *)aKey;

- (NSInteger)integerForKey:(NSString *)aKey default:(NSInteger)defaultValue;
- (NSInteger)integerForKey:(NSString *)aKey;

- (long long)longLongForKey:(NSString *)aKey default:(long long)defaultValue;
- (long long)longLongForKey:(NSString *)aKey;

- (float)floatForKey:(NSString *)aKey default:(double)defaultValue;
- (float)floatForKey:(NSString *)aKey;;

- (double)doubleForKey:(NSString *)aKey default:(double)defaultValue;
- (double)doubleForKey:(NSString *)aKey;

- (NSDate *)dateForKey:(id)key default:(NSDate *)defaultValue;
- (NSDate *)dateForKey:(id)key;

- (BOOL)boolForKey:(NSString *)aKey default:(BOOL)defaultValue;
- (BOOL)boolForKey:(NSString *)aKey;

- (NSURL *)URLForKey:(NSString *)aKey default:(NSURL *)defaultValue;
- (NSURL *)URLForKey:(NSString *)aKey;

@end
