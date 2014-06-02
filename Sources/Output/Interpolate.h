//
//  Interpolate.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/16/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataView.h"


@interface Interpolate : NSObject {
	int n ;
	NSPoint *qa, *qb, *qc, *qd, *center ;
	float *x, *y, *h, *l, *u, *z, *radius, *theta, *dTheta ;
	float z0 ;
}

- (id)initWithNumberOfPoints:(int)points z0:(float)z ;
- (void)createInterpolants:(RXF*)rxf ;
- (NSPoint)evaluate:(float)t ;
- (float)frequencyGap:(RXF*)rxf ;		//  v0.73 frequency gaps for smart interpolation

//	for subclasses
- (void)computeCoefficients:(RXF*)rxf component:(int)component ;

@end
