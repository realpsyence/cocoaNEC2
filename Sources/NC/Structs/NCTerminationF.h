//
//  NCTerminationF.h
//  cocoaNEC
//
//  Created by Kok Chen on 11/12/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class NCWire ;
@class NCSystem ;

//	Frequency dependent Terminator
@interface NCTerminationF : NSObject {
	NCWire *terminationWire ;		//  short wire in farfield that contains the TL for termination
}

+ (id)rlcTermination:(NCWire*)wire type:(int)rlcType r:(double)r l:(double)l c:(double)c system:(NCSystem*)system ;


@end
