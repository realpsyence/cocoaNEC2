//
//  Pattern3dView.h
//  cocoaNEC
//
//  Created by Kok Chen on 10/18/07.

	#import <Cocoa/Cocoa.h>

	#import "RadiationPattern.h"
	#import "PrintableView.h"
	#import "Polarization.h"

	typedef struct {
		float power ;
		float x, y, z ;
		float shade ;
	} Node ;
	
	typedef struct {
		float x0, y0, z0, p0 ;
		float x1, y1, z1, p1 ;
		float x2, y2, z2, p2 ;
		float x3, y3, z3, p3 ;
		float power ;
		float s0, s1, s2, s3 ;
	} Patch ;

	@interface Pattern3dView : PrintableView {
		RadiationPattern *pattern ;
		Node node[91][121] ;			//  2 degree x 3 degree resolution
		float center[91][121] ;
		NSColor *plotColor[257] ;
		
		NSAffineTransform *scale ;
		double rho ;
		double azimuth ;
		int gainPolarization ;
		Boolean usePhong ;
		float contrast ;
	}

	- (void)setPattern:(RadiationPattern*)pattern ;
	- (RadiationPattern*)pattern ;
	- (void)setGainScale:(double)s ;
	- (double)gainScale ;
	- (void)setAngle:(float)angle ;
	- (float)angle ;
	- (void)setContrast:(float)value ;
	- (float)contrast ;
	- (void)setGainPolarization:(int)pol ;
	- (void)setPlotType:(int)type ;
	- (int)plotType ;
	
	@end
