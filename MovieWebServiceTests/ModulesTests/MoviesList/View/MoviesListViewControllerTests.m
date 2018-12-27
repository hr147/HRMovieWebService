//
//  MoviesListViewControllerTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MoviesListViewController.h"
#import "MoviesListModuleInput.h"
//#import ""
@interface MoviesListViewControllerTests : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListViewControllerTests

- (void)setUp {
    [super setUp];

    self.controller = [[MoviesListViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListModuleInput));

    self.controller.eventHandler = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput viewIsReady]);
}

- (void)testThatControllerNotifiesPresenterOnDidSelectFilm {
    // given
    
    // when
    
    [self.controller tableView:[UITableView new] didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1]];

    // then
    OCMVerify([self.mockOutput filmDidSelectAtIndex:0]);
}

@end
