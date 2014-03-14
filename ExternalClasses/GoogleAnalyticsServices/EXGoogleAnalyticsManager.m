// EXGoogleAnalyticsManager.m
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

#import "EXGoogleAnalyticsManager.h"

#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

#define EXGAPropertyID \
    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"GAPropertyID"])

@interface EXGoogleAnalyticsManager ()
@property (readwrite, nonatomic, strong) id<GAITracker> tracker;
- (void)initialize;
@end

@implementation EXGoogleAnalyticsManager

/** Google Analytics configuration constants **/
static BOOL const kGaDryRun = NO;
static int const kGaDispatchPeriod = 30;

+ (instancetype)sharedManager
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSAssert(EXGAPropertyID, @"Sets the GAPropertyID into info.plist.");
        NSAssert([EXGAPropertyID isKindOfClass:[NSString class]], @"Sets the GAPropertyID as the type of String.");
        [self initialize];
    }
    return self;
}

@synthesize tracker = _tracker;
- (id<GAITracker>)tracker
{
    if (_tracker != nil) {
        return _tracker;
    }
    id<GAITracker> aTracker = [[GAI sharedInstance] trackerWithTrackingId:EXGAPropertyID];
    self.tracker = aTracker;
    return self.tracker;
}

- (void)initialize
{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = kGaDispatchPeriod;
    
    // Optional: set Logger to VERBOSE for debug information.
    // [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initilalize Tracker (Using HTTPS (default))
    self.tracker = [[GAI sharedInstance] trackerWithTrackingId:EXGAPropertyID];
}

- (void)trackViewWithScreenName:(NSString *)screenName
{
    [self.tracker send:[[[GAIDictionaryBuilder createAppView] set:screenName forKey:kGAIScreenName] build]];
}

@end



