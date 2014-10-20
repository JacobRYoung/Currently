//
//  DetailView.m
//  CollectionViewJSONTrial
//
//  Created by Jacob Young on 10/19/14.
//  Copyright (c) 2014 Daniwah Labs. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
	
	if(self = [super init]){
		// Creating the large movie image
		_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 64.0, 375.0f, 200.0f)];
		
		// Creating the rating image
		_ratingView = [[UIImageView alloc] init];
		
		// Creating the tag Label
		_tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 274, 355, 200)];
		self.tagLabel.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		
		// Creating the plot label
		_plotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 299, 355, 200)];
		self.plotLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		
		
		[self addSubview:self.imageView];
		[self addSubview:self.ratingView];
		[self addSubview:self.tagLabel];
		[self addSubview:self.plotLabel];
	}
	
	return self;
}

@end
