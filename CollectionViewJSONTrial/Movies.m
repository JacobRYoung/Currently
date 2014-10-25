//
//  Movies.m
//  CollectionViewJSONTrial
//
//  Created by Jacob Young on 10/20/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "Movies.h"
#import "Movie.h"

@implementation Movies

- (instancetype)init {
	
	self = [super init];
	
	if (self) {
		_things = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)refreshMovies {
	
	// Use this initialization if the designated Initializer is not correctly used.
	//_things = [[NSMutableArray alloc] init];
	
	// Initialize NSURLSession
	NSURLSession *session = [NSURLSession sharedSession];
	
	// Create a URLString from the trakt trending link (json format)
	NSString *urlString = [[NSString alloc]
						   initWithFormat:@"http://api.trakt.tv/movies/trending.json/35176d6331d2e2189eba09ad8896e0dd"];
	
	// Create an NSURL from the urlString
	NSURL *url = [[NSURL alloc] initWithString:urlString];
	
	// Create an NSURLRequest using the NSURL
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	
	// Start NSURLSessionDownloadTask usuing NSURLRequest and Block execution for data
	NSURLSessionDownloadTask *task =
	[session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
		
		
		NSData *data = [[NSData alloc] initWithContentsOfURL:location];
		
		// FIXME: Error occurs here therefore Array of Movies set to nil
		NSArray *arrayOfMovies = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
		
		// If the arra is correctly initialized
		if (arrayOfMovies) {
			for (NSDictionary *dict in arrayOfMovies) {
				
				// Initialize a Movie object with the current movie's dictionary data
				Movie *movie = [[Movie alloc] initWithDict:dict];
				
				// Add the movie object to the array
				// FIXME: If the array is unsuccessfully initialized then an NSIndexOutOfBounds is thrown.
				[self.things addObject:movie];
				
			}
			NSLog(@"HI %@", [self.things [0] title]);
		}
		else {
			NSLog(@"ARRAY UNSUCCESSFULLY INITIALIZED");
		}
		

		
	}];
	
	[task resume];
	
}


@end
