//
//  DetailViewController.h
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/13/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "DetailView.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>


@interface DetailViewController : UIViewController

@property (nonatomic) Movie *movie;
@property (strong, nonatomic) DetailView *detailView;

- (void)setRatingImage:(NSString *)ratingString;
@end