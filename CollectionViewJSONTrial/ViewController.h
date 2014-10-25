//
//  ViewController.h
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/8/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface ViewController : UICollectionViewController 

@property (strong, nonatomic) Movies *movies;

// @override designated initializer
- (instancetype)init;

@end

