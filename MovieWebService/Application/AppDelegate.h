//
//  AppDelegate.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)getFilmWithCallback:(void (^)(Film *film))callback;

@end

