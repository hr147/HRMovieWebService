//
//  MoviesListInteractorTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"

@interface MoviesListInteractorTests : XCTestCase

@property (nonatomic, strong) MoviesListInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListInteractorTests

- (void)setUp {
    [super setUp];

    self.interactor = [[MoviesListInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

@end
