//
//  NCFunctionObject.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/21/07.

#import <Cocoa/Cocoa.h>
#import "NCObject.h"

	@class NCCoax ;
	@class NCElement ;
	@class NCFunction ;
	@class NCTransform ;
	@class NCVector ;

	@interface NCFunctionObject : NCObject {
		short argPrototypes[65] ;			//  NCFUNCTION protptypes
		SEL selector ;						//  @selector() for function in NCSystem
		NCFunction *function ;				//  user defined functions
	}

	- (id)initWithSystem:(const char*)string type:(int)inType selector:(SEL)selector argPrototypes:(short*)prototypes ;
	
	- (void)runBlock:(RuntimeStack*)stack ;

	- (void)setArgPrototypes:(short*)prototypes ;
	- (short*)argPrototypes ;
	
	- (int)evalFunctionAsInt:(RuntimeStack*)inStack args:(NSArray*)args ;
	- (double)evalFunctionAsReal:(RuntimeStack*)inStack args:(NSArray*)args system:(NCSystem*)system ;
	- (NCElement*)evalFunctionAsElement:(RuntimeStack*)inStack args:(NSArray*)args ;
	- (NCCoax*)evalFunctionAsCoax:(RuntimeStack*)inStack args:(NSArray*)args ;				//	v0.81b
	- (NCVector*)evalFunctionAsVector:(RuntimeStack*)inStack args:(NSArray*)args ;			//  v0.53
	- (NCTransform*)evalFunctionAsTransform:(RuntimeStack*)inStack args:(NSArray*)args ;	//  v0.53
	- (void)evalFunctionAsVoid:(RuntimeStack*)inStack args:(NSArray*)args ;
	- (NCElement*)evalFunctionAsCard:(RuntimeStack*)inStack args:(NSArray*)args ;

	@end
