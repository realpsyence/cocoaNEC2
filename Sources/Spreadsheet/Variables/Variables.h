//
//  Variables.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/4/07.

#import "VariableObject.h"
#import "Versions.h"

@interface Variables : NSObject <NSComboBoxDataSource> {

	IBOutlet id table ;		// table view
	IBOutlet id window ;
	
	NSMutableArray *variableArray ;
	NSMutableDictionary *dictionary ;
	NSMutableArray *plist ;
	int rows ;
	
	NSTableColumn *nameColumn, *valueColumn, *commentColumn ;
	id delegate ;
	
	NSWindow *controllingWindow ;
}

- (IBAction)addVariable:(id)sender ;
- (IBAction)removeVariable:(id)sender ;

- (IBAction)closeSheet:(id)sender ;
- (void)showSheet:(NSWindow*)controllingWindow ;

- (NSMutableDictionary*)dictionary ;
- (NSArray*)variableList ;
- (void)validate ;

- (void)setDelegate:(id)client ;
- (void)deselectAll ;

- (NSMutableArray*)makePlist ;
- (void)releasePlist ;
- (void)restoreFromArray:(NSArray*)items ;

@end
