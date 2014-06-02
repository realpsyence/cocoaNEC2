//
//  StringUtils.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/27/10.
//  Copyright 2010 Kok Chen, W7AY. All rights reserved.
//

#import "StringUtils.h"


@implementation StringUtils

//  v0.65 -- Xcode 3.2.1 SDK has problem with selecting cells with only spaces

//  prepend space only if the string is not empty
+ (NSString*)prependSpace:(NSString*)str
{
	if ( [ str length ] > 0 ) return [ @" " stringByAppendingString:str ] ;
	return @"" ;
}

@end
