//
//  NCObject.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/14/07.

	#import <Cocoa/Cocoa.h>
	#import "RuntimeStack.h"

	//  classes
	#define	NCCONST				1
	#define	NCVARIABLE			2
	#define	NCFUNCTION			3
	#define	NCSYSTEM			4		//  system function

	@class NCFunction ;
	@class NCElement ;
	@class NCValue ;
	
	@interface NCObject : NSObject {
		int	type ;
		int arrayType ;
		int symClass ;
		NSString *name ;
		NCValue *value ;				//  for NCVARIABLE and NCCONSTANT
		Boolean forwardReference ;
		int arrayIndex ;
	}
	
	- (id)initWithVariable:(const char*)string type:(int)inType ;
	- (id)initWithArray:(const char*)string dimension:(int)dimension type:(int)inType ;	// v0.54
	- (id)initWithPointer:(const char*)string type:(int)inType ;						// v0.54
	- (id)initWithRealVariable:(const char*)string value:(double)v ;
	- (id)initWithIntVariable:(const char*)string value:(int)v ;						// v0.77
	- (id)initWithArrayElement:(int)index type:(int)inType ;
	- (id)initAsNil:(const char*)string ;
	- (id)initWithoutValue ;
	- (id)initWithCoaxVariable:(const char*)string value:(int)v ;						//  v0.81b
	
	- (int)symClass ;				// NCVARIABLE, NCSYSTEM, etc
	- (Boolean)isFunction ;
	- (Boolean)isForwardReference ;
	- (Boolean)isRunModelFunction ;
	
	//  used by NCFunctionObject and NCForwardReference
	- (void)setFunction:(NCFunction*)inFunction ;
	- (NCFunction*)function ;

	- (int)type ;
	- (int)arrayType ;
	
	- (NCValue*)value ;
	- (NSString*)name ;
	- (int)intValue ;
	- (double)realValue ;
	- (void)setRealValue:(double)v ;
	
	- (NCValue*)get:(RuntimeStack*)stack line:(int)line ;
	- (void)put:(NCValue*)value stack:(RuntimeStack*)stack line:(int)line ;
	
	@end
