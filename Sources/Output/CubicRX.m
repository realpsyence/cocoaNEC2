//
//  CubicRX.m
//  cocoaNEC v0.70
//
//  Created by Kok Chen on 4/11/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "CubicRX.h"


@implementation CubicRX

- (void)createInterpolants:(RXF*)rxf
{
	// create cubic spline coeffients
	[ self computeCoefficients:rxf component:0 ] ;
	[ self computeCoefficients:rxf component:1 ] ;
}

//	return RX point using cubic interpolation
- (NSPoint)evaluate:(float)t
{
	int index ;
	NSPoint result ;
	
	index = t ;
	t -= index ;
	//  rescale parameter t
	t *= h[index] ;
	result.x = qa[index].x + ( qb[index].x + ( qc[index].x + qd[index].x*t )*t )*t ;
	result.y = qa[index].y + ( qb[index].y + ( qc[index].y + qd[index].y*t )*t )*t ;

	return result ;
}

@end
