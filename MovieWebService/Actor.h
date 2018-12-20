//
//  Actor.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericRole.h"

@interface Actor : GenericRole

@property (nonatomic, strong) NSString *screenName;

- (id)initWithData:(NSDictionary *)data;

@end
