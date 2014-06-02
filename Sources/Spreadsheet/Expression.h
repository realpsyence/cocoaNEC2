//
//  Expression.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/1/07.


	#import <Cocoa/Cocoa.h>
	#include <setjmp.h>

	
	typedef struct {
		int errorCode ;
		double value ;
		int errorOffset ;
		NSString *errorString ;
	} EvalResult ;
	
	@class Primary ;

	@interface Expression : NSObject {
	
		NSDictionary *library ;
		NSDictionary *parameter ;
		NSDictionary *variable ;
		
		jmp_buf gRecoverToConsole ;
		//  lexical analyzer
		NSString *inputString ;
		int lex[256] ;
		const unsigned char *ptr, *begin ;
		//  syntax analysis
		int token ;
		double number ;
		NSString *symbol ;
		NSString *errorString ;
	}

	- (id)initWithLibrary:(NSDictionary*)libDict parameters:(NSDictionary*)paramDict variables:(NSDictionary*)varDict  ;
	
	//- (EvalResult)eval:(NSString*)string ;
	
	- (NSString*)error ;
	
	- (double)expression ;
	- (int)nextToken ;
	- (double)nextUnaryExpression ;
	
	@end
