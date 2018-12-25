//
//  MoviesListRouterInput.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Film;
@protocol MoviesListRouterInput <NSObject>
- (void)showFilmDetailWith:(Film*)film;
@end
