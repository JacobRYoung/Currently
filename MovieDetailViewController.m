//
//  MovieDetailViewController.m
//  CollectionViewJSONTrial
//
//  Created by Omar Basrawi on 12/11/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <XCDYouTubeKit/XCDYouTubeKit.h>
@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	//Set NaviagationItem Title with movie title data
	//self.navigationItemTitleLabel.title = self.movie.title;
    self.view.backgroundColor = [UIColor whiteColor];
	
	//Set MovieDetailView Image to movie.fanArt
    
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.movie.fanArt]];
            [self.moviePosterDetail sd_setImageWithURL:[NSURL URLWithString:self.movie.poster]];
            //self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];
        });
   
	//Ratings and Summary
    self.movieTitle.text = self.movie.title;
    self.plotLabel.text = self.movie.plot;
    self.ratingLabel.text = [NSString stringWithFormat:@"%@ %%",self.movie.movieRatingPercentage];
    [self setRatingImage: self.movie.rating];
}

- (IBAction)playTrailer:(UIButton *)sender {
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)" options:NSRegularExpressionCaseInsensitive error:&error];
        NSTextCheckingResult *match = [regex firstMatchInString:self.movie.trailerURL options:0 range:NSMakeRange(0, [self.movie.trailerURL length])];
        NSLog(@"%@",self.movie.trailerURL);
        if (match) {
            NSRange videoIDRange = [match rangeAtIndex:0];
            NSString *substringForFirstMatch = [self.movie.trailerURL substringWithRange:videoIDRange];
            NSLog(@"%@", substringForFirstMatch);
            
            XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:substringForFirstMatch];
            
            [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
        }
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
