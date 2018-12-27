//
//  MoviesListRouter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListRouter.h"
#import <UIKit/UIKit.h>
#import "MovieWebService-Swift.h"

@implementation MoviesListRouter

#pragma mark - MoviesListRouterInput
- (void)showFilmDetailWith:(Film*)film{
   DetailsModuleBuilder* builder = [[DetailsModuleBuilder alloc] init];
   UIViewController* detailController = [builder buildWith:film];
    [self.viewController.navigationController pushViewController:detailController animated:true];
}
- (void)showAlertWithMessage:(NSString *)message{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertVC addAction:cancelAction];
    
    [self.viewController presentViewController:alertVC animated:true completion:nil];
}
@end
