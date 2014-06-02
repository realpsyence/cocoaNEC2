//
//  Wire.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.

	#import <Cocoa/Cocoa.h>


	typedef struct {
		double x1, y1, z1 ;
		double x2, y2, z2 ;
		double radius ;
		int segments ;		
	} WireInfo ;
	
	@interface Wire : NSObject {
		WireInfo w ;
	}
	- (id)initWithLine:(char*)string ;
	- (WireInfo)info ;
	
	@end
