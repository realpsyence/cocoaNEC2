//
//  NCArc.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/17/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCArc.h"


@implementation NCArc

- (void)setArcRadius:(double)value
{
	arcRadius = value ;
}

- (void)setStartAngle:(double)value
{
	startAngle = value ;
}

- (void)setEndAngle:(double)value
{
	endAngle = value ;
}

- (NSArray*)geometryCards
{
	NSString *card, *gm ;
	
	if ( tag <= 0 ) return [ NSArray array ] ;
	
	card = [ NSString stringWithFormat:@"GA%3d%5d%10s%10s%10s%10s", tag, segments, dtos(arcRadius), dtos(startAngle), dtos(endAngle), dtos(radius) ] ;
	
	//  GM card
	gm = [ self gmCard ] ;
	if ( gm == nil ) return [ NSArray arrayWithObjects:card, nil ] ;
	return [ NSArray arrayWithObjects:card, gm, nil ] ;
}

- (NSArray*)currentGeometryCards:(int)tags
{
	NSString *card ;
	double d, xc, yc, zc ;
	
	if ( tag <= 0 ) return [ NSArray array ] ;
	
	if ( feed && [ feed excitationType ] == CURRENTEXCITATION ) {		
		//  make element length or the order of 10xradius to 18*radius
		d = radius*10 ;
		xc = yc = zc = 1000.0 ;
		//  generate 3 element
		tagForCurrentSource = tags+1 ;
		//  v0.64
		card = [ NSString stringWithFormat:@"GW%3d%5d%10s%10s%10s%10s%10s%10s%10s", tagForCurrentSource, 3, dtos(xc), dtos(yc), dtos(zc), dtos(xc+d), dtos(yc+d), dtos(zc+d), dtos(radius) ] ;
		return [ NSArray arrayWithObjects:card, nil ] ;
	}
	return [ NSArray array ] ;
}


@end
