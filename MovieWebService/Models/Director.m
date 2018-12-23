//
//  Director.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Director.h"

@implementation Director

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self){
        self.name = [data objectForKey:@"name"];
    }
    return self;
}

@end
