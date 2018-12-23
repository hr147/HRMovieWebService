//
//  FilmViewModel.h
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 23/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;
NS_ASSUME_NONNULL_BEGIN

@interface FilmViewModel : NSObject
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* filmRating;
@property (nonatomic, readonly) NSString* date;
@property (nonatomic, readonly) NSString* rating;

- (instancetype)initWithFilm:(Film*)film Withformatter:(NSDateFormatter*)formatter;
@end
NS_ASSUME_NONNULL_END


/*
 
 @property (assign, nonatomic) FilmRating filmRating;
 @property (strong, nonatomic) NSArray *languages;
 @property (assign, nonatomic) BOOL nominated;
 @property (strong, nonatomic) NSDate *releaseDate;
 @property (strong, nonatomic) NSArray<Actor*> *cast;
 
 - (id)initWithData:(NSDictionary *)data;
 
 @property (strong, nonatomic) NSString *name;
 @property (assign, nonatomic) double rating;
 @property (strong, nonatomic) Director *director;
 
 */
