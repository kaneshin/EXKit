// NSDictionary+EXKit.m
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

#import "NSDictionary+EXKit.h"

@implementation NSDictionary (EXKit)

- (BOOL)hasKey:(NSString *)aKey
{
    id obj = [self objectForKey:aKey];
    return (obj && ![obj isEqual:[NSNull null]]);
}

- (id)getValue:(id)aKey
{
    id value = [self objectForKey:aKey];
    if (!value || [value isEqual:[NSNull null]]) {
        value = nil;
    }
    return value;
}

- (NSString *)stringForKey:(NSString *)aKey default:(NSString *)defaultValue
{
    id value = [self getValue:aKey];
    if (!value) {
        value = defaultValue;
    }
    return [NSString stringWithFormat:@"%@", value];
}

- (NSString *)stringForKey:(NSString *)aKey
{
    return [self stringForKey:aKey default:@""];
}

- (NSArray *)arrayForKey:(NSString *)aKey default:(NSArray *)defaultValue
{
    id value = [self getValue:aKey];
    if (!value) {
        value = defaultValue;
    }
    return [NSArray arrayWithArray:value];
}

- (NSArray *)arrayForKey:(NSString *)aKey
{
    return [self arrayForKey:aKey default:[NSArray array]];
}

- (NSDictionary *)dictionaryForKey:(NSString *)aKey default:(NSDictionary *)defaultValue
{
    id value = [self getValue:aKey];
    if (!value) {
        value = defaultValue;
    }
    return [NSDictionary dictionaryWithDictionary:value];
}

- (NSDictionary *)dictionaryForKey:(NSString *)aKey
{
    return [self dictionaryForKey:aKey default:[NSDictionary dictionary]];
}

- (NSData *)dataForKey:(NSString *)aKey default:(NSData *)defaultValue
{
    id value = [self getValue:aKey];
    if (!value) {
        value = defaultValue;
    }
    return [NSData dataWithData:value];
}

- (NSData *)dataForKey:(NSString *)aKey
{
    return [self dataForKey:aKey default:[NSData data]];
}

- (NSInteger)integerForKey:(NSString *)aKey default:(NSInteger)defaultValue
{
    id value = [self getValue:aKey];
    if (value == nil) {
        return defaultValue;
    }
    return [value integerValue];
}

- (NSInteger)integerForKey:(NSString *)aKey
{
    return [self integerForKey:aKey default:0];
}

- (long long)longLongForKey:(NSString *)aKey default:(long long)defaultValue
{
    id value = [self getValue:aKey];
    if (value == nil) {
        return defaultValue;
    }
    return [value longLongValue];
}

- (long long)longLongForKey:(NSString *)aKey
{
    return [self longLongForKey:aKey default:0];
}

- (float)floatForKey:(NSString *)aKey default:(double)defaultValue
{
    id value = [self getValue:aKey];
    if (value == nil) {
        return defaultValue;
    }
    return [value floatValue];
}

- (float)floatForKey:(NSString *)aKey;
{
    return [self floatForKey:aKey default:0.];
}

- (double)doubleForKey:(NSString *)aKey default:(double)defaultValue
{
    id value = [self getValue:aKey];
    if (value == nil) {
        return defaultValue;
    }
    return [value doubleValue];
}

- (double)doubleForKey:(NSString *)aKey
{
    return [self doubleForKey:aKey default:0.];
}


- (NSDate *)dateForKey:(id)key default:(NSDate *)defaultValue
{
    return [NSDate dateWithTimeIntervalSince1970:[self doubleForKey:key]];
}

- (NSDate *)dateForKey:(id)key
{
    return [self dateForKey:key default:[NSDate dateWithTimeIntervalSince1970:0]];
}

- (BOOL)boolForKey:(NSString *)aKey default:(BOOL)defaultValue
{
    id value = [self getValue:aKey];
    if (value == nil) {
        return defaultValue;
    }
    return [value boolValue];
}

- (BOOL)boolForKey:(NSString *)aKey
{
    return [self boolForKey:aKey default:NO];
}

- (NSURL *)URLForKey:(NSString *)aKey default:(NSURL *)defaultValue
{
    NSString *urlString = [self stringForKey:aKey default:[defaultValue absoluteString]];
    return [NSURL URLWithString:urlString];
}

- (NSURL *)URLForKey:(NSString *)aKey
{
    return [self URLForKey:aKey default:[[NSURL alloc] init]];
}

@end
