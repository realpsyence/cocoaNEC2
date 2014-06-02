//
//  NCTaperedWire.h
//  cocoaNEC
//
//  Created by Kok Chen on 4/27/08.
//  Copyright 2008 Kok Chen, W7AY. All rights reserved.
//

	#import "NCWire.h"


	@interface NCTaperedWire : NCWire {
		NCWire *subWire0, *subWire1 ;			//  sub wires in case we split taperedWire into 3 pieces
		double taper1, taper2 ;
		int actualSegments ;
	}

	- (void)setTaper1:(double)value ;
	- (double)taper1 ;
	- (void)setTaper2:(double)value ;
	- (double)taper2 ;

	- (void)setStartingTag:(int)value ;

	@end
