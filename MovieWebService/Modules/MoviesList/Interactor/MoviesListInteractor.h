//
//  MoviesListInteractor.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractorInput.h"
#import "CellTableViewCell.h"
@protocol FilmServiceProtocol;
@protocol MoviesListInteractorOutput;

@interface MoviesListInteractor : NSObject <MoviesListInteractorInput>

@property (nonatomic, weak) id<MoviesListInteractorOutput> output;

- (instancetype)initWithFilmService:(id<FilmServiceProtocol>)service;

@end
