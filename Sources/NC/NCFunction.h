//
//  NCFunction.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/14/07.

	#import <Cocoa/Cocoa.h>
	#import "NCNode.h"
	#import "NCFunctionObject.h"

	@class NCCompound ;
	
	@interface NCFunction : NCNode {
		NCFunctionObject *functionObject ;
		NCFunctionObject *forwardReference ;
		NSMutableArray *arguments ;				// v0.76 array of NCObjects (was static NCObjects)
		Boolean isModel, isControl ;		
		NCCompound *body ;		
		//  for model
		char modelName[256] ;
		NSString *functionName ;
	}
	
	- (id)initWithParser:(NCParser*)inParser type:(int)type globals:(NCSymbolTable*)globals iterateLevel:(int)level ;
	- (NCObject*)functionObject ;
	- (char*)modelName ;
	- (NSString*)functionName ;
	//  v0.76: save into and restore from NSArray of NCValues
	//  These two methods should be used in pairs, surround a function call, to save the enclosing functions's stack values.
	//	restoreStackFrame releases the NSArray after restoring the values.
	- (NSArray*)saveStackFrame ;
	- (void)restoreStackFrame:(NSArray*)savedStackFrame ;

	@end
