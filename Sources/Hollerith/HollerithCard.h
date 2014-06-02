//
//  HollerithCard.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.

	#import <Cocoa/Cocoa.h>


	@interface HollerithCard : NSObject {
		NSString *image ;
		Boolean ignore ;
		NSString *note ;
	}
	- (NSString*)imageField ;
	- (void)setImage:(NSString*)str ;

	- (NSString*)ignoreField ;
	- (void)setIgnore:(NSString*)str ;
	- (Boolean)ignore ;
	
	- (NSString*)noteField ;
	- (void)setNote:(NSString*)str ;
	

	@end
