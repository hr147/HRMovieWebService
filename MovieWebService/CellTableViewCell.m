//
//  CellTableViewCell.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "CellTableViewCell.h"
#import "FilmViewModel.h"

@implementation CellTableViewCell
- (void) configureCellWithViewModel:(FilmViewModel*)viewModel{
    self.name.text = viewModel.name;
    self.date.text = viewModel.date;
    self.rating.text = viewModel.rating;
    self.filmRating.text = viewModel.filmRating;
}
@end
