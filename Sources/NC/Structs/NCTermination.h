//
//  NCTermination.h
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCLoad.h"

@class NCWire ;
@class NCSystem ;

#define	IMPEDANCE

//	Frequency independent termination
@interface NCTermination : NCLoad {
	NCWire *terminationWire ;		//  short wire in farfield that contains the TL for termination
}

+ (id)impedanceTermination:(NCWire*)wire real:(double)inReal imag:(double)inImag system:(NCSystem*)system ;

- (NCWire*)terminationWire ;
- (int)tagOfTerminationWire ;

@end
