//
//  RadiationPattern.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/23/07.


	#import <Cocoa/Cocoa.h>


	@interface RadiationPattern : NSObject {
		NSArray *array ;
		float mintheta, maxtheta ;
		float minphi, maxphi ;
		float meanTheta, meanPhi ;
		float maxTheta, maxPhi ;
		float maxDBv, maxDBh, maxDBt, maxDBl, maxDBr ;
		float thetaAtMaxGain, phiAtMaxGain ;
		double frequency ;
		Boolean isReference ;
		Boolean isSweep ;
		float dPhi, dTheta ;		//  v0.69
	}
	
	- (id)initWithArray:(NSArray*)inputArray frequency:(double)freq ;
	- (void)setSweep:(Boolean)sweep ;
	
	- (NSArray*)array ;
	- (int)count ;
	- (Boolean)isReference ;
	- (Boolean)isSweep ;

	- (float)thetaRange ;
	- (float)meanTheta ;
	- (float)maxTheta ;
	- (float)phiRange ;
	- (float)meanPhi ;
	- (float)maxPhi ;
	- (float)maxDBv ;
	- (float)maxDBh ;
	- (float)maxDBt ;
	- (float)maxDBl ;				//  v0.67
	- (float)maxDBr ;				//  v0.67
	- (float)thetaAtMaxGain ;
	- (float)phiAtMaxGain ;
	- (double)frequency ;
	- (float)dPhi ;					//  v0.69
	- (float)dTheta ;				//  v0.69

	@end
