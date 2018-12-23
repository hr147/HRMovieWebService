//
//  FilmViewModel.m
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 23/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "FilmViewModel.h"
#import "Film.h"

@interface FilmViewModel ()
@property (nonatomic, strong, readwrite) NSString* name;
@property (nonatomic, strong, readwrite) NSString* filmRating;
@property (nonatomic, strong, readwrite) NSString* date;
@property (nonatomic, strong, readwrite) NSString* rating;
@end

@implementation FilmViewModel
- (instancetype)initWithFilm:(Film*)film Withformatter:(NSDateFormatter*)formatter
{
    self = [super init];
    if (self) {
        self.name = film.name;
        self.rating = [NSString stringWithFormat:@"%.1f",film.rating];
        self.date = [formatter stringFromDate:film.releaseDate];
        self.filmRating = [self getRatingWithFilmRating:film.filmRating];
    }
    return self;
}

- (NSString*)getRatingWithFilmRating:(FilmRating)filmRating{
    switch (filmRating) {
        case G:
            return @"G";
        case PG:
            return @"PG";
        case PG13:
            return @"PG13";
        case R:
            return @"R";
        default:
            return @"";
    }
}

@end
