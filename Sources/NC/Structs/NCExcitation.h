//
//  NCExcitation.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/22/07.


	#import <Cocoa/Cocoa.h>

	#define	VOLTAGEEXCITATION	1
	#define	CURRENTEXCITATION	2
	#define	PLANEEXCITATION		3			//  v0.51
	#define	RIGHTEXCITATION		4			//  v0.51
	#define	LEFTEXCITATION		5			//  v0.51
	
	@interface NCExcitation : NSObject {
		int type ;			
		double real ;
		double imag ;
		double theta ;
		double phi ;
		double eta ;
	}
	
	- (id)initWithType:(int)inType real:(double)r imag:(double)i ;
	- (id)initWithType:(int)inType theta:(double)t phi:(double)p eta:(double)e ;	//  v0.51

	
	- (int)excitationType ;
	- (double)real ;
	- (double)imag ;
	
	//  incident plane wave
	- (double)theta ;
	- (double)phi ;
	- (double)eta ;

	@end
