//
//  NCLoad.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.

	#import <Cocoa/Cocoa.h>

	// http://www.nec2.org/part_3/cards/ld.html
	#define	SERIESRLC						0
	#define	PARALLELRLC						1
	#define	DISTRIBUTEDSERIESRLC			2
	#define	DISTRIBUTEDPARALLELRLC			3
	#define	IMPEDANCELOAD					4
	#define	CONDUCTIVELOAD					5
	
	#define	CONDUCTIVELOADALLSEGMENTS		6
	
	//  v0.73
	#define	INSULATEDWIRE					7	
	
	//  v0.81 (fixed termination types -- frequency dependent ones are defined in NCNetwork
	#define	TERMINATIONTYPE					0x10
	#define	IMPEDANCETERMINATION			( IMPEDANCELOAD+TERMINATIONTYPE )
	
	
	
	@interface NCLoad : NSObject {
		int type ;
		double real ;
		double imag ;
		double c ;
		int segment0 ;			//  0 == center	v0.55
		int segment1 ;			
		Boolean perLength ;
	}
	
	- (id)initAsType:(int)inType real:(double)inReal imag:(double)inImag c:(double)inC ;
	- (id)initAsSegmentType:(int)inType real:(double)inReal imag:(double)inImag c:(double)inC perLength:(Boolean)distr s0:(int)s0 s1:(int)s1 ;
	
	+ (id)impedanceLoad:(double)inReal imag:(double)inImag ;
	+ (id)conductivity:(double)inReal ;
	+ (id)rlc:(int)rlcType r:(double)r l:(double)l c:(double)c ;
	+ (id)insulateWithPermittivity:(double)permittivity conductivity:(double)conductivity radius:(double)radius ;
	
	+ (id)rlcAtSegments:(int)rlcType r:(double)r l:(double)l c:(double)c perLength:(int)perLength s0:(int)s0 s1:(int)s1 ;
	+ (id)conductivityAtSegments:(double)inReal s0:(int)s0 s1:(int)s1 ;
	+ (id)impedanceAtSegments:(double)inReal imag:(double)inImag s0:(int)s0 s1:(int)s1 ;
	
	- (int)loadType ;
	- (double)real ;
	- (double)imag ;
	- (double)conductivity ;
	- (double)r ;
	- (double)l ;
	- (double)c ;
	- (int)segment0 ;
	- (int)segment1 ;

	@end
