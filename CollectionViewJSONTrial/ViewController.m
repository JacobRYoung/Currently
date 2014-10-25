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

@interface ViewController () <UIViewControllerTransitioningDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (instancetype)init {
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.itemSize = CGSizeMake(124.0, 176.0);
	layout.minimumInteritemSpacing = 1.0;
	layout.minimumLineSpacing = 1.0;
	
	// Techincally this is being initialized correctly but somehow only the layout
	// part is being properly initialized.
	self = [super initWithCollectionViewLayout:layout];
	
	if (self) {
		_movies = [[Movies alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"Currently";
	
	[self.collectionView registerClass:
	 [CollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
	
	self.collectionView.backgroundColor = [UIColor whiteColor];
	[self refresh];
	
}

- (void)refresh {
	
	dispatch_async(dispatch_get_main_queue(), ^{
		// FIXME: [self.movies refreshMovies does not correctly set the initialized array]
		// Calls the Movie.m refreshMovies method which pulls the
		[self.movies refreshMovies];
		[self.collectionView reloadData];
		
	});
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInCollectionView:
(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
	 numberOfItemsInSection:(NSInteger)section {
	return 12;
	//return _movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	CollectionViewCell *cell =
	[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
	
	dispatch_async(dispatch_get_main_queue(), ^{
	
	// FIXME: THIS ARRAY IS BEING EVALUTATED TO ZERO
	[cell.imageView sd_setImageWithURL:
	 [NSURL URLWithString:[[self.movies.things objectAtIndex:indexPath.row] poster]]];
	
	});
	
#pragma mark background of UICollectionView Cells
	cell.backgroundColor = [UIColor lightGrayColor];
	
	UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
	title.text = [[self.movies.things objectAtIndex: indexPath.row] title];
	[cell.contentView addSubview:title];
	
	return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	Movie *movie = [self.movies.things [indexPath.row] movie];
	DetailViewController *detailMovieView = [[DetailViewController alloc] init];
	detailMovieView.modalPresentationStyle = UIModalPresentationCustom;
	detailMovieView.transitioningDelegate = self;
	
	// Pass the movie at index path to the detailView Controller
	detailMovieView.movie = movie;
	
	[self.navigationController pushViewController:detailMovieView animated:YES];
}

@end
