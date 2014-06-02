//
//  NCCompiler.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/15/07.

	#import <Cocoa/Cocoa.h>
	#import "NCNode.h"
	#import "NCParser.h"
	#import "NCPreParser.h"
	#import "NCSymbolTable.h"
	#import "NCSystem.h"
	
	@class NC ;
	
	@interface NCCompiler : NSObject {
		NSString *preprocessed ;
		NCParser *parser ;
		NCPreParser *preParser ;
		NCSymbolTable *globals ;
		NCSystem *system ;
		NC *parent ;
		int token ;
		int documentNumber ;
	}
	
	- (id)initWithString:(NSString*)string documentNumber:(int)inDocumentNumber ;
	- (id)initWithString:(NSString*)str ;			//  v0.55
	- (Boolean)compile ;
	- (Boolean)precompile ;
	
	- (NCSystem*)system ;
	- (NSArray*)parseErrors ;
	- (NCSymbolTable*)symbolTable ;
	
	@end
