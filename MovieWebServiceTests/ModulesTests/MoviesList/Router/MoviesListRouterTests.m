//
//  MoviesListRouterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListRouter.h"

@interface MoviesListRouterTests : XCTestCase

@property (nonatomic, strong) MoviesListRouter *router;

@end

@implementation MoviesListRouterTests

- (void)setUp {
    [super setUp];

    self.router = [[MoviesListRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
