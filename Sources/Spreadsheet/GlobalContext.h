//
//  GlobalContext.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/3/07.

	#import <Cocoa/Cocoa.h>
	#import "Primary.h"


	@interface GlobalContext : NSObject {
		NSMutableDictionary *libraryDict ;	
		NSMutableDictionary *parameterDict ;
		
		Primary *sinp, *sind ;
		Primary *cosp, *cosd ;
		Primary *tanp, *tand ;
		Primary *atanp, *atand ;
		Primary *atan2p, *atan2d ;
		Primary *asinp, *asind ;
		Primary *acosp, *acosd ;
	}

	- (NSMutableDictionary*)library ;

	@end
