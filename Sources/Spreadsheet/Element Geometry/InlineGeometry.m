//
//  InlineGeometry.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/15/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "InlineGeometry.h"


@implementation InlineGeometry

- (NSString*)typeString
{
	return InlineTypeString ;
}

//  create plist array for hollerith card
- (NSMutableDictionary*)makePlist 
{
	plist = [ self createGeometryForPlist ] ;
	[ plist setObject:[ [ inlineCard stringValue ] uppercaseString ] forKey:@"hollerith" ] ;
	return plist ;
}

//  create hollerith card from plist array
- (void)restoreGeometryFieldsFromDictionary:(NSDictionary*)dict
{
	[ self restoreCommonGeometryFieldsFromDictionary:dict ] ;
	[ inlineCard setStringValue:[ plist objectForKey:@"hollerith" ] ] ;
	dirty = NO ;
}


@end
