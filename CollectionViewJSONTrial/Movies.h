//
//  Movies.h
//  CollectionViewJSONTrial
//
//  Created by Jacob Young on 10/20/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movies : NSObject

@property (strong, nonatomic) NSMutableArray *things;

- (instancetype)init;
- (void)refreshMovies;

@end
