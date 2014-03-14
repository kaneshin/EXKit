// EXAppHelper.h
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

#import "EXKitDefines.h"

/**
 App's ID.
 */
#define EXAppID \
    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"AppID"])

/**
 Localized app's name.
 */
#define EXAppLocalizedName \
    ([[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"])

/**
 App's name.
 */
#define EXAppName \
    (EXAppLocalizedName ? EXAppLocalizedName : [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

/**
 App's Version.
 */
#define EXAppVersion \
    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

/**
 App's Build Version.
 */
#define EXAppBuildVersion \
    ([[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey])


typedef void(^EXSuccessBlock)(id object);
typedef void(^EXFailureBlock)(NSError *error);

typedef NS_ENUM(NSInteger, EXAppHelperAppVersionState) {
    EXAppHelperAppVersionStateNotChanged,
    EXAppHelperAppVersionStateFirst,
    EXAppHelperAppVersionStateBumpedUp,
};

typedef NS_ENUM(NSInteger, EXAppHelperFoundationVersionState) {
    EXAppHelperFoundationVersionStateNotChanged,
    EXAppHelperFoundationVersionStateFirst,
    EXAppHelperFoundationVersionStateBumpedUp,
};

EXKIT_EXTERN NSString *const EXAppHelperAppVersionStateNotChangedNotificationName;
EXKIT_EXTERN NSString *const EXAppHelperAppVersionStateFirstNotificationName;
EXKIT_EXTERN NSString *const EXAppHelperAppVersionStateBumpedUpNotificationName;
EXKIT_EXTERN NSString *const EXAppHelperFoundationVersionStateNotChangedNotificationName;
EXKIT_EXTERN NSString *const EXAppHelperFoundationVersionStateFirstNotificationName;
EXKIT_EXTERN NSString *const EXAppHelperFoundationVersionStateBumpedUpNotificationName;

@protocol EXAppHelperDelegate <NSObject>
@optional
- (void)appVersionState:(EXAppHelperAppVersionState)state;
- (void)appVersionStateNotChanged;
- (void)appVersionStateFirst;
- (void)appVersionStateBumpedUp;
@optional
- (void)foundationVersionState:(EXAppHelperFoundationVersionState)state;
- (void)foundationVersionStateNotChanged;
- (void)foundationVersionStateFirst;
- (void)foundationVersionStateBumpedUp;
@end

@interface EXAppHelper : NSObject

@property (nonatomic, assign) id<EXAppHelperDelegate> delegate;

+ (instancetype)sharedHelper;

+ (NSURL *)reviewURL;

+ (double)appVersionValue;
+ (double)appBuildVersionValue;

+ (void)setTrackingAppVersion;
+ (NSString *)getTrackingAppVersion;

+ (void)setTrackingFoundationVersion;
+ (NSString *)getTrackingFoundationVersion;

- (void)checkAppVersionState;
- (EXAppHelperAppVersionState)appVersionState;

- (void)checkFoundationVersionState;
- (EXAppHelperFoundationVersionState)foundationVersionState;
@end

