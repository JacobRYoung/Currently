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
#import <UIImageView+WebCache.h>

@interface ViewController () <UIViewControllerTransitioningDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (instancetype)init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(124.0, 176.0);
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumLineSpacing = 1.0;
    
    return (self = [super initWithCollectionViewLayout:layout]);
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Currently";
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self refresh];

}

- (void)refresh {
        
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://api.trakt.tv/movies/trending.json/35176d6331d2e2189eba09ad8896e0dd"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSMutableArray *movies = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            Movie *movie = [[Movie alloc] initWithDict:dict];
            
            movie.title = dict[@"title"];
            
            
            [movies addObject:movie];
            
        }
        _movies = [movies copy];

        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.collectionView reloadData];
            

        });
        NSLog(@"HI %@", [_movies [0] title]);
        
        
    }];
    
    [task resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
    //return _movies.count;
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = _movies[indexPath.row];
    DetailViewController *detailMovieView = [[DetailViewController alloc] init];
    detailMovieView.modalPresentationStyle = UIModalPresentationCustom;
    detailMovieView.transitioningDelegate = self;
    
    detailMovieView.movie = _movies[indexPath.row];
    
    [self.navigationController pushViewController:detailMovieView animated:YES];
}

@end
