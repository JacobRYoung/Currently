//
//  DetailView.m
//  CollectionViewJSONTrial
//
//  Created by Omar Basrawi on 10/20/14.
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
    if (self = [super init]) {
        
        // Creating the large movie image
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 64.0, 375.0f, 200.0f)];
        
        // Creating the rating image
        _ratingImageView = [[UIImageView alloc] init];
        
        // Creating the tag label
        _tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 274, 355, 200)];
        self.tagLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        [self.tagLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // Creating the plot label
        _plotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 299, 355, 200)];
        self.plotLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        
        
        
        
        [self addSubview:self.imageView];
        [self addSubview:self.ratingImageView];
        [self addSubview:self.tagLabel];
        [self addSubview:self.plotLabel];
        
        
        //NSLayoutConstraint *constraints = [NSLayoutConstraint constraintWithItem:_ratingImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_tagLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-12.0];
        //[self addConstraint:constraints];
    }
    
    return self;
}

@end
