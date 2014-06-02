//
//  NCDeck.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/22/07.

	#import <Cocoa/Cocoa.h>
	#import "RuntimeStack.h"

	@class NCSystem ;
	
	@interface NCDeck : NSObject {
		int originalTags ;
		int tagsAfterAddingCurrentSources ;
		int tagsAfterAddingRadials ;
		NSString *pathForDeck ;
		FILE *file ;
		
		NSMutableArray *hollerithArray ;
		int excitations ;
	}

	- (id)initForPath:(NSString*)path ;
	- (Boolean)generateDeck:(RuntimeStack*)stack ;
	
	- (NSArray*)hollerithArray ;

	@end
