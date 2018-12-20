//
//  GenericRole.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "GenericRole.h"

@implementation GenericRole

- (id)initWithData:(NSDictionary *)data {
    if (self) {
        self.name = [data objectForKey:@"name"];
        self.biography = [data objectForKey:@"biography"];
        self.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"dateOfBirth"] doubleValue]];
        self.nominated = [[data objectForKey:@"nominated"] boolValue];
    }
    return self;
}

@end
