//
//  PatternElement.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.


	#import <Cocoa/Cocoa.h>

	typedef struct {
		float theta ;
		float phi ;
		float dBv ;
		float dBh ;
		float dBt ;
		float dBl ;			//  v0.67 LHCP
		float dBr ;			//  v0.67 RHCP
	} PatternInfo ;

	@interface PatternElement : NSObject {
		PatternInfo w ;
		Boolean cached ;
		char line[160] ;
	}

	- (id)initWithLine:(char*)string ;
	- (PatternInfo)info ;
	
	- (Boolean)cachePattern ;
	
	@end
