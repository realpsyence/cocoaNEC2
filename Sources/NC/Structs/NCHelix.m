//
//  NCHelix.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCHelix.h"
#import "ApplicationDelegate.h"


@implementation NCHelix

- (void)setTurnsSpacing:(double)value 
{
	turnsSpacing = value ;
}

- (void)setHelixLength:(double)value 
{
	helixLength = value ;
}

//	v0.75h removed yRadius
- (void)setStartRadius:(double)x 
{
	startRadius = x ;
}

//	v0.75h removed yRadius
- (void)setEndRadius:(double)x 
{
	endRadius = x ;
}

- (NSArray*)geometryCards
{
	NSString *card, *gm ;
	float turns ;
	int engine ;
	
	if ( tag <= 0 ) return [ NSArray array ] ;
	
	//  v0.75g. v0.75h, v0.78
	engine = [ [ NSApp delegate ] engine ] ;
	if ( engine == kNEC41Engine || engine == kNEC42Engine || engine == kNEC42EngineGN2 ) {
		//  NEC-4 GH format
		turns = helixLength/turnsSpacing ;
		card = [ NSString stringWithFormat:@"GH%3d%5d%10s%10s%10s%10s%10s%10s%10d", tag, segments, dtos(turns), dtos(helixLength), dtos(startRadius), dtos(endRadius), dtos(radius),  dtos(radius), 1 ] ;
	}
	else {
		//  NEC-2 GH format
		card = [ NSString stringWithFormat:@"GH%3d%5d%10s%10s%10s%10s%10s%10s%10s", tag, segments, dtos(turnsSpacing), dtos(helixLength), dtos(startRadius), dtos(0.0), dtos(endRadius), dtos(0.0), dtos(radius) ] ;
	}
	//  GM card
	gm = [ self gmCard ] ;
	if ( gm == nil ) return [ NSArray arrayWithObjects:card, nil ] ;
	return [ NSArray arrayWithObjects:card, gm, nil ] ;
}


@end
