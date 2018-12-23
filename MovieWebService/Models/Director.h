//
//  Director.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericRole.h"

@interface Director : GenericRole

@property (strong, nonatomic) NSString* name;

- (instancetype)initWithData:(NSDictionary *)data;

@end
