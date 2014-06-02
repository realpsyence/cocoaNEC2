//
//  NCComplex.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/21/07.

	#import <Cocoa/Cocoa.h>
	#import "NCTypes.h"


	@interface NCComplex : NSObject {
		double real ;
		double imaginary ;
	}
	
	- (double)real ;
	- (void)setReal:(double)value ;
	- (double)imaginary ;
	- (void)setImaginary:(double)value ;

	@end
