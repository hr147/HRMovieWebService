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
#import "FilmService.h"
#import "MoviesListInteractorOutput.h"
#import "FilmServiceError.h"

@interface MoviesListInteractorTests : XCTestCase

@property (nonatomic, strong) MoviesListInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListInteractorTests

- (void)setUp {
    [super setUp];

    
    self.interactor = [[MoviesListInteractor alloc] initWithFilmService:[FilmService new]];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

- (void)testThatInteractorHanldesFetchFilmsRequestOnSuccess {
    // given
    
    
    // when
    [self.interactor fetchFilms];
    
    // then
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    OCMVerify([self.mockOutput filmDidLoadSuccess:[OCMArg any]]);
}

//- (void)testThatInteractorHanldesFetchFilmsRequestOnFailure {
//    // given
//    
//    id mock = [OCMockObject niceMockForClass:[FilmService class]];
//    
//    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
//        //void (^passedBlock)(NSURLResponse*, NSData*, NSError*);
//        void(^passedBlock)(NSError*);
//        //FailureHandler passedBlock;
//        [invocation getArgument:&passedBlock atIndex:2];
//        passedBlock([FilmServiceError validateFilmWith:nil]);
//    };
//    
//    [[[mock stub] andDo:proxyBlock] getFilmWithCompletion:[OCMArg any] withFailure:[OCMArg any]];
//    
//    self.interactor = [[MoviesListInteractor alloc] initWithFilmService:mock];
//    
//    // when
//    [self.interactor fetchFilms];
//    
//    // then
//    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
//    OCMVerify([self.mockOutput filmDidLoadFail:[OCMArg any]]);
//}
@end
