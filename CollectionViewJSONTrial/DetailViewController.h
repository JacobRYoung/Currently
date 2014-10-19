//
//  DetailViewController.h
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/13/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *ratingImageView;
@property (strong, nonatomic) UILabel *plotLabel;
@property (strong, nonatomic) UILabel *tagLabel;

@property (nonatomic) Movie *movie;

@end