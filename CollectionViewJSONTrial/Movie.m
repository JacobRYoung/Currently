//
//  Movie.m
//  CollectionViewJSONTrial
//
//  Created by Soubhi Alhayek on 10/8/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "Movie.h"

@implementation Movie


- (id)initWithDict:(NSDictionary *)values
{
    self.title = values[@"title"];
    self.tagline = values[@"tagline"];
    self.plot = values[@"overview"];
    self.trailerURL = [NSURL URLWithString:values[@"trailer"]];
    self.poster = [values valueForKeyPath:@"images.poster"];
    self.fanArt = [values valueForKeyPath:@"images.fanart"];
    self.rating = values[@"certification"];
    
    return self;
}


@end