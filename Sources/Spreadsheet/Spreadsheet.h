//
//  Spreadsheet.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/1/07.


	#import "GlobalContext.h"
	#import "OutputControl.h"
	#import "RuntimeStack.h"
	#import "Expression.h"
	#import "Transforms.h"
	#import "Versions.h"

	@class ElementGeometry ;
	@class WireGeometry ;
	@class NCForSpreadsheet ;


	@interface Spreadsheet : NSObject <NSComboBoxDataSource, NSTextDelegate > {
		
		IBOutlet id window ;
		IBOutlet id progressIndicator ;
		
		IBOutlet id networks ;
		IBOutlet id variables ;
		IBOutlet id transforms ;
		IBOutlet id environment ;
		IBOutlet id ncView ;
		IBOutlet id cardView ;
		IBOutlet id tabView ;

		IBOutlet id formulaTitle ;
		IBOutlet id formulaBar ;
		IBOutlet id table ;
		IBOutlet id conversionMenu ;
		IBOutlet id geometryMenu ;
				
		GlobalContext *globals ;
		int documentNumber ;
		Boolean untitled ;
		
		OutputControl *outputControl ;
		
		NSMutableArray *wireArray ;
		NSMutableArray *exceptions ;
		NSMutableArray *plist ;
		NSString *sourcePath ;

		NSText *formulaFieldEditor ;
		int selectedRow ;
		NSTableColumn *selectedColumn ;
		NSTableColumn *numberColumn ;
		NSTableColumn *x1Column ;
		NSTableColumn *y1Column ;
		NSTableColumn *z1Column ;
		NSTableColumn *x2Column ;
		NSTableColumn *y2Column ;
		NSTableColumn *z2Column ;
		NSTableColumn *diamColumn ;
		NSTableColumn *segmentsColumn ;
		NSTableColumn *transformColumn ;
		NSTableColumn *ignoreColumn ;
		NSTableColumn *nameColumn ;
		NSTableColumn *commentColumn ;
		
		//  v0.55
		NCForSpreadsheet *nc ; 
		RuntimeStack stack ;
		NSMutableString *code ;
		TransformStruct transformStruct ;
		
		//  metric, formula/eval etc
		int conversionType ;
		Boolean viewAsFormulas ;
		
		NSString *errorString ;
		
		FILE *writefd ;
		int cards ;
		int hollerithState ;
		
		Boolean dirty ;
	}
	
	- (id)initWithGlobals:(GlobalContext*)glob number:(int)num untitled:(Boolean)isUntitled ;
	
	- (void)setSourcePath:(NSString*)path ;
	- (Boolean)untitled ;
	
	- (void)setDirty ;
	
	- (void)outputCard:(NSString*)image ;

	- (IBAction)addGeometryCard:(NSButton*)sender ;	
	- (IBAction)removeGeometryCard:(id)sender ;

	- (IBAction)openEnvironment:(id)sender ;
	- (IBAction)openNetworksPanel:(id)sender ;
	- (IBAction)openVariablesPanel:(id)sender ;
	- (IBAction)openTransformsPanel:(id)sender ;
	- (IBAction)openOutputControl:(id)sender ;
	- (IBAction)openNC:(id)sender ;
	
    - (IBAction)runButtonPushed:(id)sender ;
	
	- (void)conversionSelected ;
	- (void)dictionaryChanged ;
	
	- (ElementGeometry*)wireForName:(NSString*)name ;
	
	- (void)becomeKeyWindow ;
	- (void)hideWindow ;
	- (void)showWindow ;
	- (Boolean)windowCanClose ;
	
	- (void)inspectGeometryElement ;
	
	- (Boolean)viewAsFormulas ;
	- (void)setViewAsFormulas:(Boolean)state ;
	
	- (Boolean)editTableColumn:(NSTableColumn*)tableColumn row:(int)row ;
	
	//  speadsheet created from file
	- (void)updateFromPlist:(NSDictionary*)plist name:(NSString*)name ;
	
	- (NSString*)interpretSpreadsheetCell:(NSString*)formula conversion:(int)conversionMethod ;
	- (EvalResult)evaluateFormula:(NSString*)formula ;
	- (int)intValueForObject:(id)object ;
	- (double)doubleValueForObject:(id)object ;
	
	- (NSString*)save:(Boolean)ask ;
	- (void)saveToPath:(NSString*)plistPath ;
	- (void)saveToHollerith ;
	- (NSString*)title ;
	- (void)setTitle:(NSString*)title ;
	
	//	v0.55
	- (NSArray*)transformStringsForTransform:(NSString*)name ;
	- (void)setProgress:(Boolean)state ;
		
	#define	conversionMETRIC		0
	#define	conversionENGLISH		1
	#define	conversionMIXEDENGLISH	2
	#define	conversionWAVELENGTH	3
	
	#define	conversionNormal		0
	#define	conversionInteger		1
	#define	conversionReal			2			// v0.55

	@end
