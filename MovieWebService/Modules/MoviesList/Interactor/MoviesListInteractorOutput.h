//
//  MoviesListInteractorOutput.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Film;
@protocol MoviesListInteractorOutput <NSObject>
-(void)filmDidLoadSuccess:(NSArray<Film *>*)films;
-(void)filmDidLoadFail:(NSError * )error;
@end
