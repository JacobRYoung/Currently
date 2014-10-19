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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark Title and Setup
    self.title = self.movie.title;
    self.view.backgroundColor = [UIColor whiteColor];

#pragma mark Fanart Splash
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 64.0, 375.0f, 200.0f)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];

#pragma mark Rating and Tagline Zone
    if ([self.movie.rating  isEqual:@"R"]) {
        self.ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 274, 18, 15)];
        [self.view addSubview:self.ratingImageView];
        self.ratingImageView.image = [UIImage imageNamed:@"R"];
        
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 274, 355, 200)];
        [self.view addSubview:self.tagLabel];
        self.tagLabel.text = self.movie.tagline;
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.tagLabel.numberOfLines = 0;
        [self.tagLabel sizeToFit];
    }
    else if ([self.movie.rating isEqual:@"PG-13"]){
        self.ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 274, 44, 15)];
        [self.view addSubview:self.ratingImageView];
        self.ratingImageView.image = [UIImage imageNamed:@"PG13"];
        
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(64, 274, 355, 200)];
        [self.view addSubview:self.tagLabel];
        self.tagLabel.text = self.movie.tagline;
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.tagLabel.numberOfLines = 0;
        [self.tagLabel sizeToFit];
    }
    else if ([self.movie.rating isEqual:@"PG"]){
        self.ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 274, 27, 15)];
        [self.view addSubview:self.ratingImageView];
        self.ratingImageView.image = [UIImage imageNamed:@"PG"];
        
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(47, 274, 355, 200)];
        [self.view addSubview:self.tagLabel];
        self.tagLabel.text = self.movie.tagline;
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.tagLabel.numberOfLines = 0;
        [self.tagLabel sizeToFit];
    }
    else if ([self.movie.rating isEqual:@"G"]){
        self.ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 274, 27, 15)];
        [self.view addSubview:self.ratingImageView];
        self.ratingImageView.image = [UIImage imageNamed:@"G"];
        
        
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(47, 274, 355, 200)];
        [self.view addSubview:self.tagLabel];
        self.tagLabel.text = self.movie.tagline;
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.tagLabel.numberOfLines = 0;
        [self.tagLabel sizeToFit];
        
        NSLog(@"The Movie's Rating is: %@", self.movie.rating);
    }
    else if ([self.movie.rating isEqual:@"NR"]){
        self.ratingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 274, 29, 15)];
        [self.view addSubview:self.ratingImageView];
        self.ratingImageView.image = [UIImage imageNamed:@"NR"];
        
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(49, 274, 355, 200)];
        [self.view addSubview:self.tagLabel];
        self.tagLabel.text = self.movie.tagline;
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        self.tagLabel.numberOfLines = 0;
        [self.tagLabel sizeToFit];
    }
    else {
        NSLog(@"ERROR");
        NSLog(@"The Movie's Rating is: %@", self.movie.rating);
    }
    
#pragma mark Plot
    self.plotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 299, 355, 200)];
    [self.view addSubview:self.plotLabel];
    self.plotLabel.text = self.movie.plot;
    self.plotLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    self.plotLabel.numberOfLines = 0;
    [self.plotLabel sizeToFit];

    
    
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





























