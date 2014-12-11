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

@interface DetailViewController ()

@end

@implementation DetailViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.detailView = [[DetailView alloc] init];
//    
//#pragma mark Title and Setup
//    self.title = self.movie.title;
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//#pragma mark Format Splash
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//
//    self.detailView.imageView.image =
//    [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];
//    [self.view addSubview:self.detailView.imageView];
//        
//    });
//#pragma mark Ratings and Tagline
//    [self setRatingImage:self.movie.rating];
//    [self.view addSubview:self.detailView.ratingImageView];
//    
//    self.detailView.tagLabel.numberOfLines = 0;
//    self.detailView.tagLabel.text = self.movie.tagline;
//    [self.detailView.tagLabel sizeToFit];
//    [self.view addSubview:self.detailView.tagLabel];
//
//#pragma mark Plot
//    self.detailView.plotLabel.numberOfLines = 0;
//    self.detailView.plotLabel.text = self.movie.plot;
//    [self.detailView.plotLabel sizeToFit];
//    [self.view addSubview:self.detailView.plotLabel];
//    
//#pragma mark Trailer Button
//   // self.detailView.trailerButton.backgroundColor = [UIColor lightGrayColor];
//    
//    _detailView.trailerButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(trailerButton:)];
//    self.navigationItem.rightBarButtonItem = self.detailView.trailerButton;
//
//    
//}
//
//- (void)trailerButton:(UIButton *)sender {
//    NSError *error = nil;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)" options:NSRegularExpressionCaseInsensitive error:&error];
//    NSTextCheckingResult *match = [regex firstMatchInString:self.movie.trailerURL options:0 range:NSMakeRange(0, [self.movie.trailerURL length])];
//    NSLog(@"%@",self.movie.trailerURL);
//    if (match) {
//        NSRange videoIDRange = [match rangeAtIndex:0];
//        NSString *substringForFirstMatch = [self.movie.trailerURL substringWithRange:videoIDRange];
//        NSLog(@"%@", substringForFirstMatch);
//        
//        XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:substringForFirstMatch];
//        
//        [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
//    }
//}
//
//- (void)setRatingImage:(NSString *)ratingString
//{
//    UIImage *ratingImage = [[UIImage alloc] init];
//    
//    if ([ratingString isEqualToString:@"R"]) {
//        ratingImage = [UIImage imageNamed:@"R"];
//        
//        self.detailView.ratingImageView.frame =
//        CGRectMake(10, 274, [ratingImage size].width,
//                   [ratingImage size].height);
//        self.detailView.ratingImageView.image = ratingImage;
//    }
//    else if ([ratingString isEqualToString:@"PG-13"]) {
//        ratingImage = [UIImage imageNamed:@"PG13"];
//        
//        self.detailView.ratingImageView.frame =
//        CGRectMake(10, 274, [ratingImage size].width,
//                   [ratingImage size].height);
//        
//        self.detailView.ratingImageView.image = ratingImage;
//    }
//    else if ([ratingString isEqualToString:@"PG"]) {
//        ratingImage = [UIImage imageNamed:@"PG"];
//        
//        self.detailView.ratingImageView.frame =
//        CGRectMake(10, 274, [ratingImage size].width,
//                   [ratingImage size].height);
//        
//        self.detailView.ratingImageView.image = ratingImage;
//    }
//    else if ([ratingString isEqualToString:@"G"]) {
//        ratingImage = [UIImage imageNamed:@"G"];
//        
//        self.detailView.ratingImageView.frame =
//        CGRectMake(10, 274, [ratingImage size].width,
//                   [ratingImage size].height);
//        
//        self.detailView.ratingImageView.image = ratingImage;
//        
//    }
//    else if ([ratingString isEqualToString:@"NR"]) {
//        ratingImage = [UIImage imageNamed:@"NR"];
//        
//        self.detailView.ratingImageView.frame =
//        CGRectMake(10, 274, [ratingImage size].width,
//                   [ratingImage size].height);
//        
//        self.detailView.ratingImageView.image = ratingImage;
//    }
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//
@end





























