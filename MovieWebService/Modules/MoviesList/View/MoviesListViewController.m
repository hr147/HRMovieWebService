//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"
#import "Masonry.h"
#import "MoviesListViewOutput.h"
#import "AppDelegate.h"
#import "Film.h"
#import "CellTableViewCell.h"
#import "MoviesListModuleInput.h"

@implementation MoviesListViewController{
    UITableView *tableView;
    NSArray<FilmViewModel *>* films;
}

#pragma mark - Life cycle

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}

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

- (void)viewDidLoad {
	[super viewDidLoad];
    [self.eventHandler viewDidLoad];
}

//- (void)viewWillAppear:(BOOL)animated {
//    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    [appDelegate getFilmWithCallback:^(Film *film) {
//        [self.output setData:film];
//    }];
//
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellTableViewCell";
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell configureCellWithViewModel:films[indexPath.row]];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellTableViewCell" owner:self options:nil] firstObject];
//        //cell = self.movieCell;
//        //self.movieCell = nil;
//    }
//    Film *film = [films objectAtIndex:indexPath.row];
//    cell.name.text = film.name;
//
//    NSCalendar* cal = [NSCalendar new];
//    NSString* dateText;
//    NSDateFormatter *f = [[NSDateFormatter alloc] init];
//    [f setCalendar:cal];
//    dateText = [f stringFromDate:film.releaseDate];
//
//    cell.date.text = dateText;
//
//    NSString *filmRatingText;
//    switch (film.filmRating) {
//        case G:
//            filmRatingText = @"G";
//        case PG:
//            filmRatingText = @"PG";
//        case PG13:
//            filmRatingText = @"PG13";
//        case R:
//            filmRatingText = @"R";
//        default:
//            break;
//    }
//    cell.filmRating.text = filmRatingText;
//    cell.rating.text = [[NSNumber numberWithInteger:film.rating] stringValue];
//
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    Film *film = [films objectAtIndex:indexPath.row];
//    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
    // [appDelegate.navigationController pushViewController:[builder buildWith:film] animated:YES];
}

#pragma mark - MoviesListViewInput

- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    films = @[];
    [self setup];
}

- (void)showFilmsWith:(NSArray<FilmViewModel *>*)newFilms{
    films = newFilms;
    [tableView reloadData];
}

@end
