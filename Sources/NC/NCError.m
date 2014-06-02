//
//  NCError.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/15/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCError.h"


@implementation NCError

- (id)initWithPointer:(const unsigned char*)ptr string:(NSString*)error line:(int)atline
{
	self = [ super init ] ;
	if ( self ) {
		errorPtr = ptr ;
		errorString = error ;
		line = atline ;
	}
	return self ;
}

//  object for recording errors
+ (id)errorWithPointer:(const unsigned char*)ptr string:(NSString*)error line:(int)atline
{
	NCError *result ;
	
	result = [ [ NCError alloc ] initWithPointer:ptr string:error line:atline ] ;
	if ( !result ) return nil ;
	return [ result autorelease ] ;
}

- (const unsigned char*)pointer
{
	return errorPtr ;
}

- (NSString*)string
{
	return errorString ;
}

- (int)line
{
	return line ;
}

@end
