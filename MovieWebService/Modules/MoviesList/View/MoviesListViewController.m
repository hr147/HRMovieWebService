//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "Film.h"
#import "CellTableViewCell.h"
#import "MoviesListModuleInput.h"

@implementation MoviesListViewController{
    UITableView *tableView;
    NSArray<FilmViewModel *>* films;
}

#pragma mark - Life cycle

-(void)setup{
    [self setupViews];
    [self addSubviews];
    [self setupConstraints];
}

-(void)setupViews{
    tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"CellTableViewCell" bundle:nil]  forCellReuseIdentifier:@"CellTableViewCell"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)addSubviews{
    [self.view addSubview:tableView];
}

-(void)setupConstraints{
    UIView *superview = self.view;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview);
    }];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
	[super viewDidLoad];
    [self.eventHandler viewIsReady];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellTableViewCell";
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell configureCellWithViewModel:films[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.eventHandler filmDidSelect:films[indexPath.row] atIndex:indexPath.row];
}

#pragma mark - MoviesListViewInput

- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    films = @[];
    [self setup];
}

- (void)showFilmsWith:(NSArray<FilmViewModel *>*)newFilms{
    films = newFilms;
    [tableView reloadData];
}

@end
