//
//  NCForSpreadsheet.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/16/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCForSpreadsheet.h"
#import "ApplicationDelegate.h"

@implementation NCForSpreadsheet

- (id)initWithListView:(NSTextView*)view cardView:(NSTableView*)cards
{
	self = [ super init ] ;
	if ( self ) {
		listView = view ;
		cardsView = cards ;
		[ cardsView setDataSource:self ] ;
		hollerithCardColumn = [ [ cardsView tableColumns ] objectAtIndex:1 ] ;
 	}
	return self ;
}

- (void)outputListing:(NC*)client
{
	//  also update cards tableView
	[ cardsView noteNumberOfRowsChanged ] ;	
	[ super outputListing:client ] ;
}

//	(Private API)
- (void)runInSeparateThread:(id)sender
{
	NSAutoreleasePool *pool = [ [ NSAutoreleasePool alloc ] init ] ;

	[ runLock lock ] ;
	runStatus = [ self runWorkFlowCompile:YES execute:YES allowLoops:NO runNEC:YES sourceString:sourceString ] ;
	[ sourceString release ] ;
	[ runLock unlockWithCondition:kThreadFree ] ;
	[ pool release ] ;
	[ NSThread exit ] ;
}

-(void)runSource:(NSString*)source
{
	if ( source == nil ) return ;

	if ( [ runLock tryLockWhenCondition:kThreadFree ] ) {
		[ runLock unlock ] ;
		sourceString = [ source retain ] ;
		[ NSThread detachNewThreadSelector:@selector(runInSeparateThread:) toTarget:self withObject:self ] ;
		return ;
	}
	else {
		[ [ NSAlert alertWithMessageText:@"NC engine is already busy processing a spreadsheet model." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"\nThe previous run has not yet finished.\n" ] runModal ] ;	
		return ;		//  disable Command G also
	}
}

-(void)createDeck:(NSString*)source
{
	if ( source == nil ) return ;

	if ( [ runLock tryLockWhenCondition:kThreadFree ] ) {
		sourceString = [ source retain ] ;
		runStatus = [ self runWorkFlowCompile:YES execute:YES allowLoops:NO runNEC:NO sourceString:sourceString ] ;
		[ sourceString release ] ;
		[ runLock unlockWithCondition:kThreadFree ] ;
		return ;
	}
	else {
		[ [ NSAlert alertWithMessageText:@"NC engine is already busy processing a spreadsheet model." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"\nThe previous run has not yet finished.\n" ] runModal ] ;	
		return ;		//  disable Command G also
	}
}

- (NSTextView*)listingView
{
	return listView ;
}

//	v0.55 -- client of outputListing supplies this as input string
- (NSString*)listingInput
{
	return sourceString ;
}

//	v0.55b
- (void)setProgress:(Boolean)state
{
	[ [ [ NSApp delegate ] currentSpreadsheet ] setProgress:state ] ;
}

@end
