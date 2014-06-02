/*
 *  RunInfo.h
 *  cocoaNEC
 *
 *  Created by Kok Chen on 8/27/07.
 */

typedef struct {
	float elapsedTime ;
	Boolean useQuad ;
	int errorCode ;
	//  results
	double directivity ;
	double maxGain ;
	double averageGain ;		//  v0.62
	double efficiency ;
	double azimuthAngleAtMaxGain ;
	double elevationAngleAtMaxGain ;
	double frontToBackRatio ;
	double frontToRearRatio ;
	NSArray *feedpointArray ;
} RunInfo ;


