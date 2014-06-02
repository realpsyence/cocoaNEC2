//
//  Networks.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/13/07.

	#import <Cocoa/Cocoa.h>
	#import "Versions.h"

	@class Spreadsheet ;
	@class Expression ;
	

	@interface Networks : NSObject <NSTableViewDataSource, NSComboBoxDataSource> { 

		IBOutlet id table ;		// table view
		IBOutlet id window ;

		NSMutableArray *networkArray ;
		NSTableColumn *numberColumn ;
		NSTableColumn *fromColumn ;
		NSTableColumn *typeColumn ;
		NSTableColumn *toColumn ;
		NSTableColumn *commentColumn ;

		NSWindow *controllingWindow ;
	}

	- (IBAction)addNetworkElement:(id)sender ;
	- (IBAction)removeNetworkElement:(id)sender ;	

	- (void)ncCode:(NSMutableString*)code eval:(Spreadsheet*)client ;
	- (void)outputCards:(Spreadsheet*)client expression:(Expression*)e ;		//  deprecated

	- (IBAction)closeSheet:(id)sender ;
	- (void)showSheet:(NSWindow*)controllingWindow ;	
	
	//  save networks
	- (NSMutableArray*)makePlistArray ;
	- (void)restoreFromArray:(NSArray*)items ;

	@end
