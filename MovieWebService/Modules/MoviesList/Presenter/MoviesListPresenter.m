//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "FilmViewModel.h"

@implementation MoviesListPresenter {
    NSArray *films;
}

- (void)viewDidLoad {
    [self.view setupInitialState];
    [self.interactor fetchFilms];
 }


#pragma mark - MoviesListInteractorOutput Methods

-(void)filmDidLoad:(NSArray<Film *>*)films{
    NSMutableArray<FilmViewModel *> *filmViewModels = [NSMutableArray array];
    //define formmater for display
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM, dd YYYY"];
    //casting film to filmViewModel
    for (Film * film in films) {
        FilmViewModel* viewModel = [[FilmViewModel alloc] initWithFilm:film Withformatter:dateFormatter];
        [filmViewModels addObject:viewModel];
    }
    //get main thread to show films on the list.
    __weak typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view showFilmsWith:filmViewModels];
    });
}

@end
