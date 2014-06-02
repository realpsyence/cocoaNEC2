//
//  NCMultiplePatch.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCMultiplePatch.h"


@implementation NCMultiplePatch

// v0.77
- (void)setEnd3:(WireCoord*)vector
{
	end3 = *vector ;
}

- (void)setNX:(double)value
{
	nx = value ;
}

- (void)setNY:(double)value
{
	ny = value ;
}

- (NSArray*)geometryCards
{
	NSString *card1, *card2, *gmCard ;
	
	if ( tag <= 0 ) return [ NSArray array ] ;
	
	//  SM card
	card1 = [ [ NSString alloc ] initWithFormat:@"SM%3d%5d%10s%10s%10s%10s%10s%10s", nx, ny, dtos(end1.x), dtos(end1.y), dtos(end1.z), dtos(end2.x), dtos(end2.y), dtos(end2.z) ] ;
	card2 = [ [ NSString alloc ] initWithFormat:@"SC%3d%5d%10s%10s%10s", 0, 0, dtos(end3.x), dtos(end3.y), dtos(end3.z) ] ;
	
	//  GM card
	gmCard = [ self gmCard ] ;
	if ( gmCard == nil ) [ NSArray arrayWithObjects:card1, card2, nil ] ; 	
	return [ NSArray arrayWithObjects:card1, card2, gmCard, nil ] ;
}



@end
