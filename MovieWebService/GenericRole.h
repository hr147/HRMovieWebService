//
//  GenericRole.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface GenericRole : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *biography;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic) BOOL nominated;

@property (atomic, strong) Film *film;

- (id)initWithData:(NSDictionary *)data;

@end
