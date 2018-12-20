//
//  AppDelegate.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesListBuilder.h"
#import "Film.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MoviesListBuilder *firstBuilder = [MoviesListBuilder new];
    UIViewController *viewController = [firstBuilder build];
    self.navigationController = [UINavigationController new];
    self.navigationController.viewControllers =[NSArray arrayWithObject: viewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)getFilmWithCallback:(void (^)(Film *film))callback {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSDictionary *data = @{
                               @"filmRating" : @3,
                               @"languages": @[
                                       @"English",
                                       @"Thai"
                                       ],
                               @"nominated": @1,
                               @"releaseDate": @1350000000,
                               @"cast": @[
                                       @{
                                           @"dateOfBirth": @-436147200,
                                           @"nominated": @1,
                                           @"name": @"Bryan Cranston",
                                           @"screenName": @"Jack Donnell",
                                           @"biography": @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
                                           }
                                       ],
                               @"name": @"Argo",
                               @"rating": @7.8,
                               @"director": @{
                                       @"dateOfBirth": @82684800,
                                       @"nominated": @1,
                                       @"name": @"Ben Affleck",
                                       @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                                       }
                               };
        
        Film* film = [[Film alloc] initWithData:data];
        
        data = nil;
        callback(film);
    });
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
