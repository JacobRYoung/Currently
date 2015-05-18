//
//  MovieDetailViewController.h
//  CollectionViewJSONTrial
//
//  Created by Omar Basrawi on 12/11/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import <XCDYouTubeKit/XCDYouTubeClient.h>

@interface MovieDetailViewController : UIViewController

@property (nonatomic) Movie *movie;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItemTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ratingImageView;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *plotLabel;
@property (strong, nonatomic) IBOutlet UIImageView *moviePosterDetail;
- (IBAction)playTrailer:(UIButton *)sender;



- (void)setRatingImage:(NSString *)ratingString;

@end
