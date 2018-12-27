//
//  FilmServiceError.m
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 27/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "FilmServiceError.h"
#import "Film.h"

NSErrorDomain const FilmServiceErrorDomain = @"FilmServiceErrorDomain";

@implementation FilmServiceError 

+ (NSError* )validateFilmWith:(Film*)film{
    if (film == nil){
        return [FilmServiceError filmNotFoundError];
    }else if (film.name == nil) {
        return [FilmServiceError nameNotFoundError];
    }else if(film.cast.count == 0){
        return [FilmServiceError actorNotFoundError];
    }
    return nil;
}
+ (NSError* )nameNotFoundError {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: NSLocalizedString(@"We could not found Name field in data.", nil) };
    return [NSError errorWithDomain:FilmServiceErrorDomain
                               code:-11
                           userInfo:userInfo];
}

+ (NSError* )actorNotFoundError {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: NSLocalizedString(@"We could not found Actor field in data.", nil) };
    return [NSError errorWithDomain:FilmServiceErrorDomain
                               code:-12
                           userInfo:userInfo];
}

+ (NSError* )filmNotFoundError {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: NSLocalizedString(@"We could not found film.", nil) };
    return [NSError errorWithDomain:FilmServiceErrorDomain
                               code:-13
                           userInfo:userInfo];
}
@end
