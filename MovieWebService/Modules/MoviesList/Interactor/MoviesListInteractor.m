//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "MovieWebService-Swift.h"
#import "FilmService.h"

@interface MoviesListInteractor ()
@property (strong, nonatomic) NSArray<Film*> *films;
@property (strong, nonatomic) FilmService* service;
@end

@implementation MoviesListInteractor

- (instancetype)initWithFilmService:(id<FilmServiceProtocol>)service
{
    self = [super init];
    if (self) {
        self.service = service;
    }
    return self;
}
#pragma mark - MoviesListInteractorInput

-(void)fetchFilms{
    __weak typeof(self)weakSelf = self;
    [self.service
     getFilmWithCompletion:^(NSArray<Film *> * films) {
         [weakSelf.output filmDidLoadSuccess:films];
         weakSelf.films = films;
     }
     withFailure:^(NSError * error) {
         [weakSelf.output filmDidLoadFail:error];
     }];
}

- (Film* )getFilmAtIndex:(NSInteger)index {
    if (index < self.films.count) {
        return self.films[index];
    }
    return nil;
}
@end
