//
//  RecentFile.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/19/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "RecentFile.h"


@implementation RecentFile

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		plistKey = @"none" ;
		recentPaths = [ [ NSMutableArray alloc ] init ] ;
	}
	return self ;
}

- (void)dealloc
{
	[ recentPaths release ] ;
	[ super dealloc ] ;
}

- (void)awakeFromNib
{
	//  set ourself to receive menuNeedsUpdate mewssage
	[ recentMenu setDelegate:self ] ;
	//  enable menus explicitly in menuNeedsUpdate
	[ recentMenu setAutoenablesItems:NO ] ;
}

- (void)touchedPath:(NSString*)path
{
	int i, count ;
	NSString *check ;
	
	//  first check if path already exist, if so, remove 
	count = [ recentPaths count ] ;
	if ( count >= 1 ) {
		for ( i = 0; i < count; i++ ) {
			check = [ recentPaths objectAtIndex:i ] ;
			if ( [ path isEqualToString:check ] ) {
				[ recentPaths removeObjectAtIndex:i ] ;
				break ;
			}
		}
	}
	[ recentPaths insertObject:[ path retain ] atIndex:0 ] ;		
	//  truncate array to 6
	count = [ recentPaths count ] ;
	if ( count >= 6 ) [ recentPaths removeLastObject ] ;
}

//  sender is the menu
- (void)clearItems:(id)sender
{
	[ recentPaths removeAllObjects ] ;
}

//  subclass overrides this to do nessessary operation on the path
- (void)performOpen:(NSString*)path
{
	printf( "need to implement performOpen in a RecentFile subclass\n" ) ;
}

- (void)openRecentFile:(id)sender
{
	NSString *path ;
	int n, count ;
	
	// sanity check	
	n = [ sender tag ] ;
	count = [ recentPaths count ] ;
	if ( n < 0 || n >= count ) return ;
	
	path = [ recentPaths objectAtIndex:n ] ;
	[ self performOpen:path ] ;
}

//  delegate to NSMenu
- (void)menuNeedsUpdate:(NSMenu*)menu
{
	NSMenuItem *item ;
	NSString *title ;
	int i, items, count ;
	
	if ( menu == recentMenu ) {
	
		//  first clear menu
		items = [ menu numberOfItems ] ;
		count = [ recentPaths count ] ;		
		for ( i = 0; i < items; i++ ) [ menu removeItemAtIndex:0 ] ;			
		if ( count ) {
			//  now insert items
			for ( i = 0; i < count; i++ ) {
				title = [ recentPaths objectAtIndex:i ] ;
				if ( title != nil ) {
					item = [ menu addItemWithTitle:title action:@selector(openRecentFile:) keyEquivalent:@"" ] ;
					[ item setTarget:self ] ;
					[ item setTag:i ] ;
				}
			}
			[ menu addItem:[ NSMenuItem separatorItem ] ] ;
			item = [ menu addItemWithTitle:@"Clear Menu" action:@selector(clearItems:) keyEquivalent:@"" ] ;
			[ item setTarget:self ] ;
		}
	}
}

- (void)updatePrefsFromDict:(NSDictionary*)dict
{
	NSArray *recent ;
	
	recent = [ dict objectForKey:plistKey ] ;
	if ( recent ) [ recentPaths addObjectsFromArray:recent ] ;
}

- (void)savePrefsToPlist:(NSMutableDictionary*)plist
{
	[ plist setObject:recentPaths forKey:plistKey ] ;
}

@end
