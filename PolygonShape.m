//
//  PolygonShape.m
//  WhatATool
//
//  Created by Edward Wong on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if ([super init]) {
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
		[self setMinimumNumberOfSides:min];
	}
	return self;
}


@synthesize numberOfSides;
- (void)setNumberOfSides:(int)value {
	if (value < minimumNumberOfSides)
		NSLog(@"Invalid number of sides: %d is less than the allowed minimum number of %d sides.", value, minimumNumberOfSides);
	else {
		if (value > maximumNumberOfSides)
			NSLog(@"Invalid number of sides: %d is greater than the allowed maximum number of %d sides.", value, maximumNumberOfSides);
		else
			numberOfSides = value;
	}
}

@synthesize minimumNumberOfSides;
- (void)setMinimumNumberOfSides:(int)value {
	if (value > maximumNumberOfSides)
		NSLog(@"Invalid number of sides: %d is greater than the allowed maximum number of %d sides.", value, maximumNumberOfSides);
	else {
		if (value > numberOfSides)
			NSLog(@"Invalid number of sides: %d is greater than the number of %d sides.", value, numberOfSides);
		else
			minimumNumberOfSides = value;
	}
}

@synthesize maximumNumberOfSides;
- (void)setMaximumNumberOfSides:(int)value {
	if (value < minimumNumberOfSides)
		NSLog(@"Invalid number of sides: %d is less than the allowed minimum number of %d sides.", value, minimumNumberOfSides);
	else {
		if (value < numberOfSides)
			NSLog(@"Invalid number of sides: %d is greater than the allowed maximum number of %d sides.", value, maximumNumberOfSides);
		else
			maximumNumberOfSides = value;
	}
}


- (float)angleInDegrees {
	return (180*(numberOfSides-2)/numberOfSides);
}

- (float)angleInRadians {
	return ([self angleInDegrees]*(M_PI/180));
}

- (NSString *)name {
	if (numberOfSides == 3)
		return @"Triangle";

	if (numberOfSides == 4)
		return @"Square";
	
	if (numberOfSides == 5)
		return @"Pentagon";
	
	if (numberOfSides == 6)
		return @"Hexagon";
	
	if (numberOfSides == 7)
		return @"Heptagon";
	
	if (numberOfSides == 8)
		return @"Octogon";
	
	if (numberOfSides == 9)
		return @"Nonagon";
	
	if (numberOfSides == 10)
		return @"Decagon";
	
	if (numberOfSides == 11)
		return @"Hendecagon";

	if (numberOfSides == 12)
		return @"Dodecagon";
}

- (NSString *)description {
	NSLog(@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians)", numberOfSides, self.name, self.angleInDegrees, self.angleInRadians);
}

- (void)dealloc {
	NSLog(@"PolygonShape dealloc was called.");
	[super dealloc];
}

@end
