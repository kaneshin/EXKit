//
//  EXKitNSStringTests.m
//  EXKit
//
//  Created by Shintaro Kaneko on 3/20/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+EXKit.h"

@interface EXKitNSStringTests : XCTestCase
@end

@implementation EXKitNSStringTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSString *testString;
    testString = @".";
    XCTAssertEqual(NO, NSStringIsEmpty(testString));
    testString = @"";
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
    testString = nil;
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
    testString = Nil;
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
    testString = NULL;
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
    testString = (NSString *)[NSNull null];
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
    testString = [NSNull null];
    XCTAssertEqual(YES, NSStringIsEmpty(testString));
}

@end
