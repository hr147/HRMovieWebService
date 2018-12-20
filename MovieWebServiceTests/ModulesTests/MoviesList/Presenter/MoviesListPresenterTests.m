//
//  MoviesListPresenterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"

@interface MoviesListPresenterTests : XCTestCase

@property (nonatomic, strong) MoviesListPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation MoviesListPresenterTests


- (void)setUp {
    [super setUp];

    self.presenter = [[MoviesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(MoviesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(MoviesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(MoviesListViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}


- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

@end
