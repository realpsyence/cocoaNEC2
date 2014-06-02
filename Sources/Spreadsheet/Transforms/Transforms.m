//
//  Transforms.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "Transforms.h"


@implementation Transforms

static Boolean alpha( int a ) ;
static Boolean numer( int a ) ;


- (id)init
{
	int i ;
	
	self = [ super init ] ;
	if ( self ) {
		rows = 0 ;
		dictionary = [ [ NSMutableDictionary alloc ] initWithCapacity:16 ] ;	//  dictionary contains the TransformObject for each key (transform name)
		transformArray = [ [ NSMutableArray alloc ] init ] ;
		plist = nil ;
		nameColumn = nil ;
		for ( i = 0; i < 6; i++ ) transformColumn[i] = nil ;
		delegate = nil ;
		controllingWindow = nil ;
	}
	return self ;
}

- (void)setDelegate:(id)client
{
	delegate = client ;
}

- (void)deselectAll
{
	[ table deselectAll ] ;
}

- (void)awakeFromNib
{
	NSArray *column = [ table tableColumns ] ;
	int i ;

	nameColumn = [ column objectAtIndex:0 ] ;
	for ( i = 0; i < 6; i++ ) transformColumn[i] = [ column objectAtIndex:i+1 ] ;

	[ table setDelegate:self ] ;
	[ table setDataSource:self ] ;
	
	// make sheet opaque
	[ window setAlphaValue:1.0 ] ;
}

//	(Private API)
- (void)setDirty
{
	if ( delegate != nil ) [ delegate setDirty ] ;
}

- (NSArray*)transformList
{
	return transformArray ;
}

- (void)showSheet:(NSWindow*)mainWindow
{
	controllingWindow = mainWindow ;
	[ NSApp beginSheet:window modalForWindow:controllingWindow modalDelegate:nil didEndSelector:nil contextInfo:nil ] ;
}

- (IBAction)closeSheet:(id)sender
{
	if ( controllingWindow ) {
		[ NSApp endSheet:window ] ;
		[ window orderOut:controllingWindow ] ;
		controllingWindow = nil ;
	}
}

- (IBAction)addTransform:(id)sender
{
	int n = [ table selectedRow ]+1 ;
	
	if ( n < 0 ) n = 0 ; 
	
	[ transformArray insertObject:[ [ TransformObject alloc ] init ] atIndex:n ] ;
	rows++ ;

	[ table reloadData ] ;
	[ table selectRowIndexes:[ NSIndexSet indexSetWithIndex:n ] byExtendingSelection:NO ] ;
	[ table scrollRowToVisible:n ] ;	
	[ table editColumn:0 row:n withEvent:nil select:YES ] ;
	[ self setDirty ] ;
}

- (void)removeRow:(int)row
{
	NSString *str ;
	TransformObject *v ;
	
	v = [ transformArray objectAtIndex:row ] ;
	
	str = [ v name ] ;
	if ( [ str length ] > 0 ) [ dictionary removeObjectForKey:str ] ; 
	
	[ transformArray removeObjectAtIndex:row ] ;
	[ v release ] ;
	rows-- ;
	if ( rows < 0 ) rows = 0 ;
	[ table reloadData ] ;
	[ self setDirty ] ;
}

- (IBAction)removeTransform:(id)sender
{
	int row = [ table selectedRow ] ;
	if ( row < 0 ) return ;

	[ self removeRow:row ] ;
}

//  NSDataSource methods
- (int)numberOfRowsInTableView:(NSTableView*)tableView
{
	if ( tableView != table ) return 0 ;
	return rows ;
}

//  some name or value changed
- (void)transformChanged:(id)sender
{
	if ( delegate && [ delegate respondsToSelector:@selector(transformChanged:) ] ) [ delegate transformChanged:sender ] ;
	[ self setDirty ] ;
}

- (id)tableView:(NSTableView*)tableView objectValueForTableColumn:(NSTableColumn*)tableColumn row:(int)row
{
	int i ;
	
	if ( tableView == table ) {
		TransformObject *var = [ transformArray objectAtIndex:row ] ;	
		
		if ( tableColumn == nameColumn ) return [ var name ] ;
		for ( i = 0; i < 6; i++ ) {
			if ( tableColumn == transformColumn[i] ) return [ var valueAtIndex:i ] ;
		}
	}
	return @"" ;
}

- (Boolean)validateName:(NSString*)str
{
	int i, len, c ;
	
	len = [ str length ] ;
	
	if ( len > 0 ) {
		if ( alpha( [ str characterAtIndex:0 ] ) ) {
			for ( i = 0; i < len; i++ ) {
				c = [ str characterAtIndex:i ] ;
				if ( !alpha( c ) && !numer( c ) ) break ;
			}
			if ( i >= len ) return YES ;
		}
	}
	[ [ NSAlert alertWithMessageText:@"Bad transform name." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"\nTransform names should start with an alphabet or the underscore character, and contain only alphabets, numbers or underscore characters.\n" ] runModal ] ;
	return NO ;
}

- (void)tableView:(NSTableView*)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn*)tableColumn row:(int)row
{
	NSArray *column ;
	NSString *oldName, *newName ;
	TransformObject *transformObject ;
	int i ;
	
	if ( tableView != table ) return ;
	
	column = [ table tableColumns ] ;
	transformObject = [ transformArray objectAtIndex:row ] ;
	
	if ( tableColumn == [ column objectAtIndex:0 ] ) {
		if ( ![ self validateName:object ] ) {
			if ( [ transformObject empty ] ) [ self removeRow:row ] ;
			return ;
		}
		oldName = [ transformObject name ] ;
		newName = object ;
		//  create another dictionary object with the same name and assign the old value
		if ( [ oldName isEqualToString:newName ] ) {
			//  did not change
			return ;
		}
		if ( [ dictionary objectForKey:newName ] != nil ) {
			for ( i = 0; i < rows; i++ ) {
				if ( [ newName isEqualToString:[ [ transformArray objectAtIndex:i ] name ] ] ) {
					[ [ NSAlert alertWithMessageText:@"Transform name already in use." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:[ NSString stringWithFormat:@"\nThe transform %s is already defined in row %d of the transforms table.\n", [ newName UTF8String ], i+1 ] ] runModal ] ;
					if ( [ transformObject empty ] ) [ self removeRow:row ] ;
					return ;
				}
			}
			[ [ NSAlert alertWithMessageText:@"Oops!" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"\nInternal error with transform table.  Please save the file, quit and relaunch cocoaNEC.\n" ] runModal ] ;
			if ( [ transformObject empty ] ) [ self removeRow:row ] ;
			return ;
		}
		//  if previous name is different and not empty, first remove from dictionary
		if ( [ oldName length ] > 0 ) [ dictionary removeObjectForKey:oldName ] ;
		//  add new name to dictionary with old Primary value
		[ dictionary setObject:transformObject forKey:newName ] ;
		[ transformObject setName:newName ] ;
		[ self transformChanged:self ] ;
		return ;
	}
	for ( i = 0 ; i < 6; i++ ) {
		if ( tableColumn == [ column objectAtIndex:i+1 ] ) {
			[ transformObject setValue:object atIndex:i ] ;
			oldName = [ transformObject name ] ;
			if ( [ oldName length ] > 0 ) [ dictionary setObject:transformObject forKey:oldName ] ;
			[ self transformChanged:self ] ;
			return ;
		}
	}
}
 
//  reselect a row in case a table cell has not yet been registered
//  this should be called everytime just before the transforms dictionary is used
- (void)validate
{
	int row = [ table selectedRow ] ;
	
	if ( row >= 0 ) {
		[ table deselectAll:self ] ;
		[ table selectRowIndexes:[ NSIndexSet indexSetWithIndex:row ] byExtendingSelection:NO ] ;
	}
}

- (NSMutableArray*)makePlist 
{
	NSMutableDictionary *item ;
	int n, i ;
	
	plist = [ [ NSMutableArray alloc ] init ] ;
	n = [ transformArray count ] ;
	for ( i = 0; i < n; i++ ) {
		item = [ [ transformArray objectAtIndex:i ] makeTransform ] ;
		if ( item != nil ) [ plist addObject:item ] ;
	}
	return plist ;
}

- (void)releasePlist
{
	int i, n ;
	TransformObject *v ;
	
	if ( plist ) {
		[ plist removeAllObjects ] ;
		[ plist release ] ;
		plist = nil ;
		n = [ transformArray count ] ;
		//  release all descendants of plist array
		for ( i = 0; i < n; i++ ) {
			v = [ transformArray objectAtIndex:i ] ;
			if ( v != nil ) [ v releaseTransform ] ;
		}
	}
}

//  update from plist (NSArray of NSDictionary)
- (void)restoreFromArray:(NSArray*)items
{
	int i, count = [ items count ] ;
	TransformObject *v ;
	NSDictionary *dict ;

	for ( i = 0; i < count; i++ ) {
		dict = [ items objectAtIndex:i ] ;
		v = [ [ TransformObject alloc ] init ] ;
		[ transformArray insertObject:v atIndex:rows ] ;
		[ v restoreTransform:dict ] ;
		// now save into transform dictionry
		[ dictionary setObject:v forKey:[ v name ] ] ;
		rows++ ;
	}
	[ table reloadData ] ;
	[ table scrollRowToVisible:0 ] ;	
	[ table deselectAll:self ] ;
}

static Boolean alpha( int a )
{
	if ( a >= 'a' && a <= 'z' ) return true ;
	if ( a >= 'A' && a <= 'Z' ) return true ;
	return ( a == '_' ) ;
}

static Boolean numer( int a )
{
	return ( a >= '0' && a <= '9' ) ;
}

//	(Private API)
- (Boolean)noTransform:(NSString*)string
{
	NSString *checkString ;
	
	if ( string == nil || [ string length ] == 0 ) return YES ;
	
	checkString = [ string stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceCharacterSet ] ] ;
	if ( checkString == nil || [ checkString length ] == 0 ) return YES ;
	return NO ;
}

//	return NSArray of 6 transform strings; return nil if no transform
- (NSArray*)transformForName:(NSString*)name
{
	TransformObject *obj ;
	
	if ( [ self noTransform:name ] ) return [ NSArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", nil ] ;
	
	obj = [ dictionary objectForKey:name ] ;
	if ( obj == nil ) {
		[ [ NSAlert alertWithMessageText:@"Transform error." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"\nTransform '%s' not found.\n", [ name UTF8String ] ] runModal ] ;
		return [ NSArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", nil ] ;
	}
	return [ obj transform ] ;
}

@end
