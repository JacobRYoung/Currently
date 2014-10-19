//
//  Movie.h
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/8/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *tagline;
@property (copy, nonatomic) NSString *poster;
@property (copy, nonatomic) NSString *fanArt;
@property (copy, nonatomic) NSString *plot;
@property (copy, nonatomic) NSURL *trailerURL;
@property (copy, nonatomic) NSString *rating;


- (id)initWithDict:(NSDictionary *)values;

@end
