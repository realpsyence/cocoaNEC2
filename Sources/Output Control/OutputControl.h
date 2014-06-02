//
//  OutputControl.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/26/07.


	#import <Cocoa/Cocoa.h>


	@interface OutputControl : NSObject {
		IBOutlet id window ;
		IBOutlet id precisionMatrix ;
		IBOutlet id azimuth0Matrix ;
		IBOutlet id azimuth1Matrix ;
		IBOutlet id azimuth2Matrix ;
		IBOutlet id azimuthDistance ;
		IBOutlet id elevationAngle ;
		IBOutlet id elevation0Matrix ;
		IBOutlet id elevation1Matrix ;
		IBOutlet id elevation2Matrix ;
		IBOutlet id elevationDistance ;
		IBOutlet id azimuthAngle ;
		IBOutlet id ekMatrix ;
		IBOutlet id d3Matrix ;
		
		NSMatrix *azimuthMatrix[3] ;
		NSMatrix *elevationMatrix[3] ;
		
		float elevationAngles[3] ;
		float azimuthAngles[3] ;
				
		NSWindow *controllingWindow ;
	}
	
	- (void)setDefaultPattern:(Boolean)seton ;
	
	- (Boolean)isQuadPrecision ;
	- (Boolean)isExtendedkernel ;
	- (Boolean)is3DSelected ;
	
	- (NSMutableDictionary*)makeDictionaryForPlist  ;
	- (void)restoreFromDictionary:(NSDictionary*)dict ;

	- (float*)elevationAnglesForAzimuthPlot ;
	- (float*)azimuthAnglesForElevationPlot ;
	
	- (int)numberOfAzimuthPlots ;
	- (int)numberOfElevationPlots ;
	
	- (float)azimuthDistance ;
	- (float)elevationDistance ;
	
	- (IBAction)closeSheet:(id)sender ;
	- (void)showSheet:(NSWindow*)controllingWindow ;	

@end
