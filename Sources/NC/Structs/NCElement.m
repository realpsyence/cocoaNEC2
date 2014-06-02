//
//  NCElement.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/20/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCElement.h"


@implementation NCElement

- (NSArray*)geometryCards
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

- (NSArray*)excitationCards
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

- (NSArray*)networkCardsForCurrentExcitation
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

- (NSArray*)loadCards
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

//	v0.81
- (double)segmentLength
{
	//  override by NCWire
	return 1e6 ;
}

//	v0.75a
- (NSArray*)loadCardsForInsulatedWire
{
	printf( "loadCardsForInsulatedWire called but not override by NCWire\n" ) ;
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

- (NSArray*)networkCardsForFrequency:(double)frequency
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

- (NSArray*)currentGeometryCards:(int)tags
{
	//  override by subclasses that are concrete Geometry Elements
	return [ NSArray array ] ;
}

@end
