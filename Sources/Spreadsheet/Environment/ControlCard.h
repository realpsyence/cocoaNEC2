//
//  ControlCard.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/15/07.

	#import <Cocoa/Cocoa.h>


	@interface ControlCard : NSObject {
		NSString *hollerith, *comment ;
		Boolean ignore ;
	}
	
	- (NSString*)hollerith ;
	- (void)setHollerith:(NSString*)name ;
	- (NSString*)ignoreField ;
	- (void)setIgnore:(NSString*)name ;
	- (NSString*)comment ;
	- (void)setComment:(NSString*)name ;
	
	- (Boolean)ignoreCard ;
	
	- (NSDictionary*)dictForCard ;
	- (void)setCardFromDict:(NSDictionary*)dict ;


	@end
