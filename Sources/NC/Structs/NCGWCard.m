//
//  NCGWCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCGWCard.h"

//  Used by GW, GH and GM

@implementation NCGWCard

- (id)initWithRuntime:(RuntimeStack*)rt
{
	self = [ super init ] ;
	if ( self ) {
		f1 = f2 = f3 = f4 = f5 = f6 = f7 = 0.0 ;
		i1 = 100 ;
		i2 = 21 ;
		i3 = i4 = 0 ;
		runtime = rt ;
	}
	return self ;
}

- (void)setF1:(double)value
{
	f1 = value ;
}

- (void)setF2:(double)value
{
	f2 = value ;
}

- (void)setF3:(double)value
{
	f3 = value ;
}

- (void)setF4:(double)value
{
	f4 = value ;
}

- (void)setF5:(double)value
{
	f5 = value ;
}

- (void)setF6:(double)value
{
	f6 = value ;
}

- (void)setF7:(double)value
{
	f7 = value ;
}

- (void)setI1:(int)value
{
	i1 = value ;
}

- (void)setI2:(int)value
{
	i2 = value ;
}

- (void)setI3:(int)value
{
	i3 = value ;
}

- (void)setI4:(int)value
{
	i4 = value ;
}

- (NSArray*)geometryCards
{
	NSString *card ;
	
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%10s%10s%10s%10s%10s%10s%10s", type, i1, i2, dtos(f1), dtos(f2), dtos(f3), dtos(f4), dtos(f5), dtos(f6), dtos(f7) ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end
