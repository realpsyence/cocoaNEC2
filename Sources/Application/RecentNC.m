//
//  RecentNC.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/15/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "RecentNC.h"

#import "ApplicationDelegate.h"
#import "plist.h"

@implementation RecentNC

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		plistKey = kRecentNC ;
	}
	return self ;
}

- (void)performOpen:(NSString*)path
{
	[ [ NSApp delegate ] openNCModelAtPath:path ] ;
}

@end
