//
//  NCComplex.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/21/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCComplex.h"


@implementation NCComplex

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		real = imaginary = 0.0 ;
	}
	return self ;
}

- (double)real
{
	return real ;
}

- (void)setReal:(double)value
{
	real = value ;
}

- (double)imaginary
{
	return imaginary ;
}

- (void)setImaginary:(double)value
{
	imaginary = value ;
}

@end
