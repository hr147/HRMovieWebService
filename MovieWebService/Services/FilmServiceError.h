//
//  FilmServiceError.h
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 27/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Film;


@interface FilmServiceError : NSObject
+ (NSError* )validateFilmWith:(Film*)film;
@end


