//
//  Hollerith.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.


	#import <Cocoa/Cocoa.h>
	#import "OutputControl.h"
	#import "Versions.h"

	@interface Hollerith : NSObject <NSComboBoxDataSource> {

		IBOutlet id window ;
		IBOutlet id editField ;
		IBOutlet id table ;
		IBOutlet id metricField ;
		IBOutlet id scale ;
		IBOutlet id positionText ;
		
		OutputControl *outputControl ;
		
		id delegate ;
		int rows, selectedRow ;
		NSTableColumn *indexColumn, *cardColumn, *ignoreColumn, *noteColumn ;
		NSMutableArray *cards ;

		int documentNumber ;		//  unique document fumber
		NSString *sourcePath ;
		Boolean dirty ;
		
		NSRect origin ;
		float advanceWidth ;
	}

	- (id)initWithDocumentNumber:(int)number ;

	- (void)setSourcePath:(NSString*)path ;
	- (void)updateFromFile:(FILE*)deck name:(NSString*)name ;

	- (IBAction)addHollerithCard:(id)sender ;	
	- (IBAction)removeHollerithCard:(id)sender ;

    - (IBAction)runButtonPushed:(id)sender ;
    - (IBAction)openOutputControl:(id)sender ;
	
	- (NSString*)save:(Boolean)ask ;

	- (void)hideWindow ;
	- (void)showWindow ;
	- (void)becomeKeyWindow ;
	- (Boolean)windowCanClose ;
	
	- (void)selecting:(int)index ;

	@end
