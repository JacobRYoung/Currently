//
//  MovieDetailViewController.m
//  CollectionViewJSONTrial
//
//  Created by Omar Basrawi on 12/11/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	//Set NaviagationItem Title with movie title data
	self.navigationItemTitleLabel.title = self.movie.title;
	
	//Set MovieDetailView Image to movie.fanArt
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];
    
	//Ratings and Summary
    self.summaryLabel.text = self.movie.plot;
    self.ratingLabel.text = self.movie.ratingPercentage;
	[self setRatingImage: self.movie.rating];
}

- (void)setRatingImage:(NSString *)ratingString
{
    UIImage *ratingImage = [[UIImage alloc] init];

    if ([ratingString isEqualToString:@"R"]) {
        ratingImage = [UIImage imageNamed:@"R"];
    }
    else if ([ratingString isEqualToString:@"PG-13"]) {
        ratingImage = [UIImage imageNamed:@"PG13"];
    }
    else if ([ratingString isEqualToString:@"PG"]) {
        ratingImage = [UIImage imageNamed:@"PG"];
    }
    else if ([ratingString isEqualToString:@"G"]) {
        ratingImage = [UIImage imageNamed:@"G"];

	}
    else if ([ratingString isEqualToString:@"NR"]) {
        ratingImage = [UIImage imageNamed:@"NR"];

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
