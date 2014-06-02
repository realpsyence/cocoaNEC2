//
//  Environment.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/15/07.

	#import <Cocoa/Cocoa.h>
	#import "NECTypes.h"
	#import "CallStringForNC.h"
	#import "Versions.h"
	
	@class	Spreadsheet ;

	@interface Environment : NSObject <NSComboBoxDataSource> {

		IBOutlet id client ;
		IBOutlet id window ;
		
		IBOutlet id table ;				// in-line table view

		IBOutlet id freqMatrix ;
		IBOutlet id freqField ;
		IBOutlet id freqLowField ;
		IBOutlet id freqHighField ;
		IBOutlet id freqStepField ;
		IBOutlet id linearCheckBox ;

		IBOutlet id f1Field ;
		IBOutlet id f2Field ;
		IBOutlet id f3Field ;
		IBOutlet id f4Field ;
		
		IBOutlet id groundMenu ;
		IBOutlet id dielectricField ;
		IBOutlet id conductivityField ;
		IBOutlet id dText ;
		IBOutlet id cText ;
		IBOutlet id cUnits ;
		IBOutlet id sommerfeldCheckbox ;
	
		//  radials		
		IBOutlet id radialsMatrix ;
		IBOutlet id radialsCoordMatrix ;
		IBOutlet id radialsParamMatrix ;
		
		//Expression *constEvaluator ;
		
		NSString *radialsX, *radialsY, *radialsZ ;
		NECRadials necRadials ;
		int selectedRadials ;

		IBOutlet id comments ;
		
		NSMutableArray *frequencyArray ;
		NSMutableArray *commentsArray ;
		NSMutableArray *radialsArray ;
		
		int groundType ;			// 0 normal, 1 perfect, 2 Sommerfeld
		Boolean isFreeSpace ;
		Boolean hasWarned ;
		
		//  in line control cards
		int rows ;
		NSTableColumn *numberColumn, *hollerithColumn, *commentColumn, *ignoreColumn ;
		NSMutableArray *controlCards ;

		NSMutableDictionary *parameter ;
		NSWindow *controllingWindow ;
	}
	
	- (IBAction)closeSheet:(id)sender ;
	- (void)showSheet:(NSWindow*)controllingWindow ;
	
	- (IBAction)addInline:(id)sender ;
	- (IBAction)removeInline:(id)sender ;

	- (IBAction)freqMatrixChanged:(id)sender ;
	
	- (void)addComment:(char*)line ;
	- (void)setCommentFromArray:(NSArray*)array ;
	
	- (Boolean)generateNECRadials:(NSMutableString*)string ;
	- (Boolean)generateRadials:(NSMutableString*)string eval:(Spreadsheet*)eval ;
	- (int)generateComments:(NSMutableString*)string ;

	- (NSDictionary*)parameter ;
	- (NSArray*)frequencyArray ;
	- (double)frequency ;
	- (double)dielectric ;
	- (double)conductivity ;
	- (int)groundType ;
	- (Boolean)isFreeSpace ;
	
	- (NSMutableDictionary*)makeDictionaryForPlist  ;
	- (void)restoreFromDictionary:(NSDictionary*)dict ;
	
	- (NSMutableDictionary*)makeRadials ;
	- (void)restoreRadialsFromDictionary:(NSDictionary*)dict ;
	
	- (void)updateDictionary ;
	- (void)groundMenuChanged ;
	- (void)radialsMatrixChanged ;
	
	//  (Private API)
	- (void)setRadialsMatrix ;
	- (void)setGroundMenu ;

	@end
