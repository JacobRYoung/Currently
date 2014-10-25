//
//  DetailViewController.m
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/13/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "DetailViewController.h"
#import "Movie.h"
#import "ViewController.h"
#import "DetailView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.detailView = [[DetailView alloc] init];
	
#pragma mark Title and Setup
	self.title = self.movie.title;
	self.view.backgroundColor = [UIColor whiteColor];
	
#pragma mark Format Splash
	self.detailView.imageView.image =
	[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];
	//[self.view addSubview:self.detailView.imageView];
	
#pragma mark Ratings and TagLine
	[self setRatingImage:self.movie.rating];
	//[self.view addSubview:self.detailView.ratingView];
	
	
	self.detailView.tagLabel.numberOfLines = 0;
	self.detailView.tagLabel.text = self.movie.tagline;
	[self.detailView.tagLabel sizeToFit];
	//[self.view addSubview:self.detailView.tagLabel];
	
#pragma mark Plot
	self.detailView.plotLabel.numberOfLines = 0;
	self.detailView.plotLabel.text = self.movie.plot;
	[self.detailView.plotLabel sizeToFit];
	//[self.view addSubview:self.detailView.plotLabel];
	
	
	[self.view addSubview:self.detailView];
}

- (void)setRatingImage:(NSString *)ratingString {
	
	
	/// Note: Deadstore happens when you initialize an object to an new object
	// then refll the object as done below, esentially initializing the object
	// twice.
	UIImage *ratingImage;
	
	if ([ratingString isEqualToString:@"R"]) {
		ratingImage = [UIImage imageNamed:@"R"];
		
		self.detailView.ratingView.frame =
		CGRectMake(10, 274, [ratingImage size].width,
				   [ratingImage size].height);
		self.detailView.ratingView.image = ratingImage;
	
	}
	else if ([ratingString isEqualToString:@"PG-13"]) {
		ratingImage = [UIImage imageNamed:@"PG13"];
		
		self.detailView.ratingView.frame =
		CGRectMake(10, 274, [ratingImage size].width,
				   [ratingImage size].height);
		self.detailView.ratingView.image = ratingImage;

	}
	else if ([ratingString isEqualToString:@"PG"]) {
		ratingImage = [UIImage imageNamed:@"PG"];
		
		self.detailView.ratingView.frame =
		CGRectMake(10, 274, [ratingImage size].width,
				   [ratingImage size].height);
		self.detailView.ratingView.image = ratingImage;

	}
	else if ([ratingString isEqualToString:@"G"]) {
		ratingImage = [UIImage imageNamed:@"G"];
		
		self.detailView.ratingView.frame =
		CGRectMake(10, 274, [ratingImage size].width,
				   [ratingImage size].height);
		self.detailView.ratingView.image = ratingImage;

	}
	else if ([ratingString isEqualToString:@"NR"]) {
		ratingImage = [UIImage imageNamed:@"NR"];
		
		self.detailView.ratingView.frame =
		CGRectMake(10, 274, [ratingImage size].width,
				   [ratingImage size].height);
		self.detailView.ratingView.image = ratingImage;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end