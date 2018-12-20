//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"
#import "AppDelegate.h"
#import "Film.h"

@implementation MoviesListViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
	[super viewDidLoad];

    [self.output didTriggerViewReadyEvent];
    [self.output setViewForSetup:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate getFilmWithCallback:^(Film *film) {
        [self.output setData:film];
    }];

}

#pragma mark - MoviesListViewInput

- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
