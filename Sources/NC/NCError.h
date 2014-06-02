//
//  NCError.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/15/07.

	#import <Cocoa/Cocoa.h>


	@interface NCError : NSObject {
		const unsigned char *errorPtr ;
		int line ;
		NSString *errorString ;
	}
	
	+ (id)errorWithPointer:(const unsigned char*)ptr string:(NSString*)error line:(int)atline ;
	- (id)initWithPointer:(const unsigned char*)ptr string:(NSString*)error line:(int)atline ;

	- (const unsigned char*)pointer ;
	- (NSString*)string ;
	- (int)line ;

	@end
