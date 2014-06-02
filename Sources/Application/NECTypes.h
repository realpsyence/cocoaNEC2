/*
 *  NECTypes.h
 *  cocoaNEC
 *
 *  Created by Kok Chen on 10/7/07.
 */


typedef struct {
	Boolean useNECRadials ;
	int n ;
	double length ;
	double wireRadius ;
} NECRadials ;


typedef struct {
	double directivity ;
	double maxGain ;
	double averageGain ;		//  v0.62
	double efficiency ;
	double azimuthAngleAtMaxGain ;
	double elevationAngleAtMaxGain ;
	double frontToBackRatio ;
	double frontToRearRatio ;
	NSMutableArray *feedpointArray ;
} NECInfo ;
