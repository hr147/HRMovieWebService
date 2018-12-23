//
//  FilmService.h
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 22/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Film;

@protocol FilmServiceProtocol <NSObject>
typedef void(^CompletionHandler)(NSArray<Film *>*);
- (void)getFilmWithCompletion:(CompletionHandler)completion;
@end


@interface FilmService : NSObject<FilmServiceProtocol>

@end

NS_ASSUME_NONNULL_END

