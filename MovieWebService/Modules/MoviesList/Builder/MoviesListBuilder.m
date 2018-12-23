//
//  MoviesListAssembly.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListBuilder.h"

#import "MoviesListViewController.h"
#import "MoviesListInteractor.h"
#import "MoviesListPresenter.h"
#import "MoviesListRouter.h"
#import "FilmService.h"
@implementation MoviesListBuilder

- (UIViewController *)build {
    
    MoviesListViewController *viewController = [MoviesListViewController new];

    MoviesListRouter *router = [MoviesListRouter new];
    router.viewController = viewController;

    MoviesListPresenter *presenter = [MoviesListPresenter new];
    presenter.view = viewController;
    presenter.router = router;

    MoviesListInteractor *interactor = [[MoviesListInteractor alloc] initWithFilmService:[FilmService new]];
    interactor.output = presenter;
    presenter.interactor = interactor;
    viewController.eventHandler = presenter;
    
    return viewController;

}

@end
