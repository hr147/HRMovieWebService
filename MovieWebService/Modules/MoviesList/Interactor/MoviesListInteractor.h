//
//  MoviesListInteractor.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractorInput.h"
#import "CellTableViewCell.h"

@protocol MoviesListInteractorOutput;

@interface MoviesListInteractor : NSObject <MoviesListInteractorInput, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<MoviesListInteractorOutput> output;
@property (nonatomic, strong) IBOutlet CellTableViewCell *movieCell;

@end
