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
#import "Film.h"
#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MoviesListInteractor.h"
#import "FilmViewModel.h"


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
    [self.presenter viewIsReady];

    // then
    OCMVerify([self.mockView setupInitialState]);
    OCMVerify([self.mockInteractor fetchFilms]);
}

- (void)testThatPresenterHandlesFilmDidSelectEvent {
    
    // given
    Film *film = [Film new];
    OCMStub([self.mockInteractor getFilmAtIndex:0]).andReturn(film);
    
    // when
    [self.presenter filmDidSelectAtIndex:0];
    
    // then
    OCMVerify([self.mockInteractor getFilmAtIndex:0]);
    OCMVerify([self.mockRouter showFilmDetailWith:film]);
}

- (void)testThatPresenterHandlesInteractorOutput {
    
    // given
    
    NSArray<Film*> *films = @[[Film new]];
    
    //when
    
    [self.presenter filmDidLoad:films];
    
    // then
    // we need to wait for real result
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    OCMVerify([self.mockView showFilmsWith:[OCMArg any]]);
}
@end
