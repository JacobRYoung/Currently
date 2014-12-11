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
    
    
//Title
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLabel.text = self.movie.title;
    
//Display Movie Image
    
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.fanArt]]];
    
//Ratings and Summary
    
    //[self setRatingImage:self.movie.rating];
    
    self.summaryLabel.text = self.movie.plot;
    self.ratingLabel.text = self.movie.ratingPercentage;
    


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
