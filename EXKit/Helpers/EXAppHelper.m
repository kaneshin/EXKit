// EXAppHelper.m
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

#import "EXAppHelper.h"

NSString *const EXAppHelperAppVersionStateNotChangedNotificationName        = @"EXAppHelperAppVersionStateNotChangedNotificationName";
NSString *const EXAppHelperAppVersionStateFirstNotificationName             = @"EXAppHelperAppVersionStateFirstNotificationName";
NSString *const EXAppHelperAppVersionStateBumpedUpNotificationName          = @"EXAppHelperAppVersionStateBumpedUpNotificationName";
NSString *const EXAppHelperFoundationVersionStateNotChangedNotificationName = @"EXAppHelperFoundationVersionStateNotChangedNotificationName";
NSString *const EXAppHelperFoundationVersionStateFirstNotificationName      = @"EXAppHelperFoundationVersionStateFirstNotificationName";
NSString *const EXAppHelperFoundationVersionStateBumpedUpNotificationName   = @"EXAppHelperFoundationVersionStateBumpedUpNotificationName";

@implementation EXAppHelper

+ (instancetype)sharedHelper
{
    static id _sharedHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHelper = [[[self class] alloc] init];
    });
    return _sharedHelper;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSAssert(EXAppID, @"Sets the AppID into info.plist.");
        NSAssert([EXAppID isKindOfClass:[NSString class]], @"Sets the AppID as the type of String.");
    }
    return self;
}

+ (NSURL *)reviewURL
{
    NSAssert(EXAppID, @"Sets the AppID into info.plist.");
    NSAssert([EXAppID isKindOfClass:[NSString class]], @"Sets the AppID as the type of String.");
    NSString *templateReviewURLiOS7 = @"http://itunes.apple.com/app/id";
    return [NSURL URLWithString:[templateReviewURLiOS7 stringByAppendingString:EXAppID]];
}

EXKIT_STATIC_INLINE double
versionStringToDouble(NSString *versionString)
{
    double value = 0.;
    NSArray *components = [versionString componentsSeparatedByString:@"."];
    for (NSInteger i = 0, n = [components count]; i < n; ++i) {
        value += [[components objectAtIndex:i] doubleValue] * (100. / pow(100, i));
    }
    return value;
}

+ (double)appVersionValue;
{
    return versionStringToDouble(EXAppVersion);
}

+ (double)appBuildVersionValue;
{
    return versionStringToDouble(EXAppBuildVersion);
}

static NSString *const EXAppHelperTrackingAppVersionKey = @"EXAppHelperTrackingAppVersionKey";
+ (void)setTrackingAppVersion
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:EXAppVersion forKey:EXAppHelperTrackingAppVersionKey];
    [defaults synchronize];
}

+ (NSString *)getTrackingAppVersion
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:EXAppHelperTrackingAppVersionKey];
}

static NSString *const EXAppHelperTrackingFoundationVersionKey = @"EXAppHelperTrackingFoundationVersionKey";
+ (void)setTrackingFoundationVersion
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%f", NSFoundationVersionNumber] forKey:EXAppHelperTrackingFoundationVersionKey];
    [defaults synchronize];
}

+ (NSString *)getTrackingFoundationVersion
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:EXAppHelperTrackingFoundationVersionKey];
}

- (void)checkAppVersionState
{
    [self appVersionState];
}

- (EXAppHelperAppVersionState)appVersionState
{
    NSString *trackingAppVersion = [[self class] getTrackingAppVersion];
    NSString *currentAppVersion = EXAppVersion;
    EXAppHelperAppVersionState state = EXAppHelperAppVersionStateNotChanged;
    if (trackingAppVersion == nil) {
        state = EXAppHelperAppVersionStateFirst;
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperAppVersionStateFirstNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(appVersionStateFirst)]) {
            [_delegate appVersionStateFirst];
        }
    } else if (![trackingAppVersion isEqualToString:currentAppVersion]) {
        state = EXAppHelperAppVersionStateBumpedUp;
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperAppVersionStateBumpedUpNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(appVersionStateBumpedUp)]) {
            [_delegate appVersionStateBumpedUp];
        }
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperAppVersionStateNotChangedNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(appVersionStateNotChanged)]) {
            [_delegate appVersionStateNotChanged];
        }
    }
    
    if (state > EXAppHelperAppVersionStateNotChanged) {
        [[self class] setTrackingAppVersion];
    }
    
    if ([_delegate respondsToSelector:@selector(appVersionState:)]) {
        [_delegate appVersionState:state];
    }
    return state;
}

- (void)checkFoundationVersionState
{
    [self foundationVersionState];
}

- (EXAppHelperFoundationVersionState)foundationVersionState
{
    double trackingFoundationVersion = [[[self class] getTrackingFoundationVersion] doubleValue];
    double currentFoundationVersion = NSFoundationVersionNumber;
    EXAppHelperFoundationVersionState state = EXAppHelperFoundationVersionStateNotChanged;
    if (trackingFoundationVersion == 0) {
        state = EXAppHelperFoundationVersionStateFirst;
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperFoundationVersionStateFirstNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(foundationVersionStateFirst)]) {
            [_delegate foundationVersionStateFirst];
        }
    } else if (trackingFoundationVersion < currentFoundationVersion) {
        state = EXAppHelperFoundationVersionStateBumpedUp;
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperFoundationVersionStateBumpedUpNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(foundationVersionStateBumpedUp)]) {
            [_delegate foundationVersionStateBumpedUp];
        }
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:EXAppHelperFoundationVersionStateNotChangedNotificationName object:nil];
        if ([_delegate respondsToSelector:@selector(foundationVersionStateNotChanged)]) {
            [_delegate foundationVersionStateNotChanged];
        }
    }
    
    if (state > EXAppHelperFoundationVersionStateNotChanged) {
        [[self class] setTrackingFoundationVersion];
    }
    
    if ([_delegate respondsToSelector:@selector(foundationVersionState:)]) {
        [_delegate foundationVersionState:state];
    }
    return state;
}

@end