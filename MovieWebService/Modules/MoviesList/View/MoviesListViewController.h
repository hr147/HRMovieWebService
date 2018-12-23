//
//  MoviesListViewController.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MoviesListViewInput.h"
#import "Film.h"

@protocol MoviesListViewOutput;
@protocol MoviesListModuleInput;

@interface MoviesListViewController : UIViewController <MoviesListViewInput, UITableViewDataSource, UITableViewDelegate> {
}

@property (nonatomic, strong) id<MoviesListModuleInput> eventHandler;

@end
