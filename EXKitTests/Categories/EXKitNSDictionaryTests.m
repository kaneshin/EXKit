//
//  EXKitNSDictionaryTests.m
//  EXKit
//
//  Created by Shintaro Kaneko on 3/6/14.
//  Copyright (c) 2014 kaneshinth.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDictionary+EXKit.h"

@interface EXKitNSDictionaryTests : XCTestCase
@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation EXKitNSDictionaryTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.dictionary = @{@"key1": @"value1", @"key2": @"value2",
                        @"string": @"Hello",
                        @"array": @[@"0"],
                        @"dictionary": @{@"key": @"value"},
                        @"data": [NSData data],
                        @"number": @"1.2",
                        @"zero": @"0",
                        @"yes": @"1",
                        @"url": @"http://google.com"};
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertEqual([self.dictionary hasKey:@"key0"], NO, @"");
    XCTAssertNotEqual([self.dictionary hasKey:@"key0"], YES, @"");
    
    XCTAssertEqual([self.dictionary hasKey:@"key1"], YES, @"");
    XCTAssertNotEqual([self.dictionary hasKey:@"key1"], NO, @"");
    
    XCTAssertEqualObjects([self.dictionary stringForKey:@"string"], @"Hello", @"");
    
    XCTAssertEqualObjects([self.dictionary arrayForKey:@"array"], @[@"0"], @"");
    
    XCTAssertEqualObjects([self.dictionary dictionaryForKey:@"dictionary"], @{@"key": @"value"}, @"");
    
    XCTAssertEqualObjects([self.dictionary dataForKey:@"data"], [NSData data], @"");
    
    XCTAssertEqual([self.dictionary integerForKey:@"number"], 1, @"");
    XCTAssertEqual([self.dictionary longLongForKey:@"number"], 1LL, @"");
    XCTAssertEqual([self.dictionary floatForKey:@"number"], 1.2f, @"");
    XCTAssertEqual([self.dictionary doubleForKey:@"number"], 1.2, @"");
    XCTAssertEqual([self.dictionary boolForKey:@"yes"], YES, @"");
    XCTAssertEqual([self.dictionary boolForKey:@"zero"], NO, @"");
    
    XCTAssertEqualObjects([self.dictionary dateForKey:@"zero"], [NSDate dateWithTimeIntervalSince1970:0], @"");
    XCTAssertEqualObjects([self.dictionary URLForKey:@"url"], [NSURL URLWithString:@"http://google.com"], @"");
}

@end
