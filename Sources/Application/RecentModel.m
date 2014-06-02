//
//  RecentModel.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/19/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "RecentModel.h"
#import "ApplicationDelegate.h"
#import "plist.h"


@implementation RecentModel

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		plistKey = kRecentModels ; @"Recent Models" ;
	}
	return self ;
}

//  open recent antenna model
- (void)performOpen:(NSString*)path
{
	[ [ NSApp delegate ] openModelAtPath:path includeInRecent:YES ] ;
}

@end
