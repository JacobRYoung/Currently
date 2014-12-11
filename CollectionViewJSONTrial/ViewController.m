//
//  ViewController.m
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/8/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "DetailViewController.h"
#import "CollectionViewCell.h"
#import "MovieDetailViewController.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>


@interface ViewController () <UIViewControllerTransitioningDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController {
    NSInteger *selectedIndex;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Currently";
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self refresh];

}

- (void)refresh {
        
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.trakt.tv/movies/trending.json/35176d6331d2e2189eba09ad8896e0dd" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = responseObject;
        NSMutableArray *movies = [NSMutableArray array];
        
        for (NSDictionary *dictioanry in array) {
            Movie *movie = [[Movie alloc] initWithDict:dictioanry];
            
            [movies addObject:movie];
        }
        self.movies = [movies copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    //            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please check your internet connection!" preferredStyle:UIAlertControllerStyleAlert];
    //            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    //            [alertController addAction:okAction];
    //            [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Movie *movie = _movies[indexPath.row];
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:movie.poster]];
        
    });
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
//    title.text = movie.title;
//    [cell.contentView addSubview:title];
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailMovieSegue"]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        
        Movie *movie = self.movies[indexPath.row];
        MovieDetailViewController *movieDetailViewController = segue.destinationViewController;
        movieDetailViewController.movie = movie;
        
    }
    
}
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    Movie *movie = self.movies[indexPath.row];
//    MovieDetailViewController *detailMovieView = [[MovieDetailViewController alloc] init];
//    detailMovieView.modalPresentationStyle = UIModalPresentationCustom;
//    detailMovieView.transitioningDelegate = self;
//    
//    detailMovieView.movie = movie;
//    
//    [self.navigationController pushViewController:detailMovieView animated:YES];
//}

@end
