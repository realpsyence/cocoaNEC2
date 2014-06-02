//
//  NCMultiplePatch.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCArc.h"


@interface NCMultiplePatch : NCArc {
	int nx ;
	int ny ;
	WireCoord end3 ;
}

- (void)setEnd3:(WireCoord*)vector ;

- (void)setNX:(double)value ;
- (void)setNY:(double)value ;


@end
