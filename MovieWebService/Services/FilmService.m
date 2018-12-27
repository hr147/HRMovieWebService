//
//  FilmService.m
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 22/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "FilmService.h"
#import "Film.h"
#import "FilmServiceError.h"


@implementation FilmService

- (void)getFilmWithCompletion:(CompletionHandler)completion withFailure:(FailureHandler)failure{
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSDictionary *data = @{
                               @"filmRating" : @3,
                               @"languages": @[
                                       @"English",
                                       @"Thai"
                                       ],
                               @"nominated": @1,
                               @"releaseDate": @1350000000,
                               @"cast": @[
                                       @{
                                           @"dateOfBirth": @-436147200,
                                           @"nominated": @1,
                                           @"name": @"Bryan Cranston",
                                           @"screenName": @"Jack Donnell",
                                           @"biography": @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
                                           }
                                       ],
                               @"name": @"Argo",
                               @"rating": @7.8,
                               @"director": @{
                                       @"dateOfBirth": @82684800,
                                       @"nominated": @1,
                                       @"name": @"Ben Affleck",
                                       @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                                       }
                               };
        
        Film* film = [[Film alloc] initWithData:data];
        NSError *error = [FilmServiceError validateFilmWith:film];
        if (error){
            failure(error);
        }else{
            NSArray<Film*> *films = @[film];
            data = nil;
            completion(films);
        }
    });
}
@end
