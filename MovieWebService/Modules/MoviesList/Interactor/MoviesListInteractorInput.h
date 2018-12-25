//
//  MoviesListInteractorInput.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Film;

@protocol MoviesListInteractorInput <NSObject>

-(void)fetchFilms;
- (Film* )getFilmAtIndex:(NSInteger)index;

@end
