//
//  NCSymbolTable.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/16/07.


	#import <Cocoa/Cocoa.h>
	#import "NCParser.h"


	@class NCObject ;
	@class NCFunctionObject ;
	
	@interface NCSymbolTable : NSObject {
		NCParser *parser ;
		NSMutableArray *actualArray ;
	}
	
	- (id)initWithCapacity:(int)capacity parser:(NCParser*)inParser ;
	- (id)initWithSymbolTable:(NCSymbolTable*)globals parser:(NCParser*)inParser ;

	- (NCObject*)addObject:(NCObject*)symbol ;
	- (NCObject*)addFunctionObject:(NCFunctionObject*)symbol ;
		
	- (NCObject*)containsObject:(NCObject*)object ;
	- (NCObject*)containsIdent:(NSString*)ident ;
	
	- (void)setDouble:(double)value forIdentifier:(NSString*)ident ;
		
	- (int)count ;
	- (NCObject*)symbolAtIndex:(int)index ;
	- (void)getObjects:(id*)aBuffer range:(NSRange)aRange ;
	
	- (NSArray*)actualArray ;
	
	//  debugging
	- (void)dumpSymbols ;

	@end
