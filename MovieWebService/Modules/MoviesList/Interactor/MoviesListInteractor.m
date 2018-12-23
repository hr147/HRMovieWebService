//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "MovieWebService-Swift.h"
#import "FilmService.h"

@interface MoviesListInteractor ()
@property (strong, nonatomic) FilmService* service;
@end

@implementation MoviesListInteractor

- (instancetype)initWithFilmService:(id<FilmServiceProtocol>)service
{
    self = [super init];
    if (self) {
        self.service = service;
    }
    return self;
}
#pragma mark - MoviesListInteractorInput

-(void)fetchFilms{
    __weak typeof(self)weakSelf = self;
    [self.service getFilmWithCompletion:^(NSArray<Film *>  * _Nonnull films) {
        [weakSelf.output filmDidLoad:films];
    }];
}
//- (void)setData:(NSArray *)films1 {
//    films = films1;
//    [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(view);
//        make.right.mas_equalTo(view);
//        make.top.mas_equalTo(view);
//        make.bottom.mas_equalTo(view);
//    }];
//
//    [tableView reloadData];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return films.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"CellTableViewCell";
//    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
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
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    Film *film = [films objectAtIndex:indexPath.row];
//    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
//   // [appDelegate.navigationController pushViewController:[builder buildWith:film] animated:YES];
//}

@end
