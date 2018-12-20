//
//  Film.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film.h"
#import "Actor.h"
#import "Director.h"

@implementation Film

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.filmRating = [[data objectForKey:@"filmRating"] doubleValue];
        self.languages = [data objectForKey:@"languages"];
        [self setNominated:[[data objectForKey:@"nominated"] boolValue]];
        self.releaseDate = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"releaseDate"] doubleValue]];
        self.name = [data objectForKey:@"name"];
        self.rating = [[data objectForKey:@"rating"] doubleValue];
        self.director = [[Director alloc] initWithData:[data objectForKey:@"director"]];
        NSMutableArray *castsList = nil;
        NSArray *castsData = [data objectForKey:@"casts"];
        for (NSDictionary *castData in castsData) {
            Actor *actor = [[Actor alloc] initWithData:castData];
            actor.film = self;
            [castsList addObject:actor];
        }
        self.cast = castsList;
        [castsList removeAllObjects];
    }
    return self;
}


- (void)setName:(NSString *)name {
    if (name != _name) {
        name = _name;
    }
}

- (void)setNominated:(BOOL)nominate;
{
    nominated = nominate;
}

@end
