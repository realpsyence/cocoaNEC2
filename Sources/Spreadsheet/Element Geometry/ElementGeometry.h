//
//  ElementGeometry.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/5/07.

	#import <Cocoa/Cocoa.h>
	#import "Expression.h"
	#import "WireTypes.h"
	#import "CallStringForNC.h"
	#import "Versions.h"
	
	typedef struct {
		int from ;
		int to ;
	} SegmentRange ;
	
	@interface ElementGeometry : NSObject {
		IBOutlet id window ;
		IBOutlet id typeTab ;
		
		NSString *card1, *card2 ;
		NSString *name, *comment ;						//  fields in spreadsheet
		NSMutableDictionary *plist ;
		
		id delegate ;									//  delegate is a spreadsheet
		int selectedType ;
		
		//  type = WIRETYPE  (GW)
		IBOutlet id wireCoord1 ;						//  x, y, z
		IBOutlet id wireCoord2 ;						//  x, y, z
		IBOutlet id wireProperties ;					//  radius, segments
		IBOutlet id wireTransform ;
		
		// type = ARCTYPE (GA)
		IBOutlet id arcIntMatrix ;
		IBOutlet id arcFloatMatrix ;
		IBOutlet id arcTransform ;
		
		// type = HELIXTYPE (GH)
		IBOutlet id helixIntMatrix ;
		IBOutlet id helixFloatMatrix ;
		IBOutlet id helixTransform ;
		
		// type = PATCHTYPE (SP)
		IBOutlet id patchShape ;
		IBOutlet id patchFloatMatrix1 ;
		IBOutlet id patchFloatMatrix2 ;
		IBOutlet id patchTransform ;
		
		// type = MPATCHTYPE (SM)
		IBOutlet id mpatchNX;
		IBOutlet id mpatchNY ;
		IBOutlet id mpatchFloatMatrix1 ;
		IBOutlet id mpatchFloatMatrix2 ;
		IBOutlet id mpatchTransform ;
		
		// type = INLINE (Card Image)
		IBOutlet id inlineCard ;
		
		//  Excitation
		IBOutlet id exMenu ;
		//  Voltage source
		IBOutlet id exLocationMatrix ;
		IBOutlet id exLocationSegment ;
		IBOutlet id exVoltageMatrix ;
		//  Current source
		IBOutlet id curLocationMatrix ;
		IBOutlet id curLocationSegment ;
		IBOutlet id currentMatrix ;
		// EX Hollerith
		IBOutlet id exHollerith ;
		
		//  Loading
		IBOutlet id loadMenu ;
		//  series RLC 
		IBOutlet id seriesLocationMatrix ;
		IBOutlet id seriesLocationFrom ;
		IBOutlet id seriesLocationTo ;
		IBOutlet id seriesRLCMatrix ;
		IBOutlet id seriesPerLength ;
		//  parallel RLC 
		IBOutlet id parallelLocationMatrix ;
		IBOutlet id parallelLocationFrom ;
		IBOutlet id parallelLocationTo ;
		IBOutlet id parallelRLCMatrix ;
		IBOutlet id parallelPerLength ;
		//  Impedance 
		IBOutlet id impedanceLocationMatrix ;
		IBOutlet id impedanceLocationFrom ;
		IBOutlet id impedanceLocationTo ;
		IBOutlet id	impedanceMatrix ;
		//  Conductivity 
		IBOutlet id conductivityLocationMatrix ;
		IBOutlet id conductivityLocationFrom ;
		IBOutlet id conductivityLocationTo ;
		IBOutlet id	conductivity ;		
		//  LD card
		IBOutlet id loadHollerith ;
		
		int spreadsheetRow ;
		
		int startingTag, endingTag ;
		Boolean opened ;					// to distingished betwwen closed and hidden
		Boolean ignore ;
		Boolean dirty ;				
		
		ElementGeometry *attachedWire ;		// attached wires such as current sources, etc
		
		int	elementIndex ;					// index of element in wireArray
	}
	
	- (id)initWithDelegate:(id)client ;						// faceless types call this
	- (id)initWithDelegate:(id)client type:(int)type ;
	- (id)initWithDelegate:(id)client data:(NSDictionary*)dict ;
	- (id)delegate ;
	
	- (NSTextField*)transformField ;
	
	- (int)excitationSegment:(NSMatrix*)matrix segNumber:(NSTextField*)field ;
	- (int)excitationSegment:(NSMatrix*)matrix segNumber:(NSTextField*)field segments:(id)segmentsField ;
	
	- (int)selectedSegment:(NSMatrix*)matrix segNumber:(NSTextField*)field ;
	- (SegmentRange)selectedSegment:(NSMatrix*)matrix segNumber:(NSTextField*)from to:(NSTextField*)to ;
	
	//	v0.55
	- (NSString*)ncForGeometry:(int)index ;
	- (NSString*)ncForExcitation:(int)index ;
	- (NSString*)ncForLoading:(int)index ;
	- (int)elementIndex ;
		
	//  old direct card generator
	- (NSArray*)geometryCards:(Expression*)e tagStarting:(int)tag spreadsheetRow:(int)row ;
	- (NSArray*)excitationCards:(Expression*)e ;
	- (NSArray*)networkForExcitationCards ;
	- (NSArray*)loadingCards:(Expression*)e ;
	
	- (ElementGeometry*)attachedWire ;
	
	- (void)openInspector:(id)client ;
	- (void)closeInspector:(id)client ;
	- (void)selectTabView ;
	- (void)bringToFront ;
	- (void)hideWindow ;
	- (void)showWindow ;
	- (Boolean)opened ;
	- (Boolean)ignoreCard ;

	- (int)wireType ;
	- (NSString*)typeString ;
	
	- (double)maxDimension ;

	//  strings for spreadsheet columns
	- (NSString*)componentOfEnd1:(int)index ;
	- (void)setComponentOfEnd1:(int)index string:(NSString*)str ;
	- (NSString*)componentOfEnd2:(int)index ;
	- (void)setComponentOfEnd2:(int)index string:(NSString*)str ;
		
	// spreadsheet direct fields
	- (NSString*)nameField ;
	- (void)setName:(NSString*)str ;
	- (NSString*)ignoreField ;
	- (void)setIgnore:(NSString*)str ;
	- (NSString*)commentField ;
	- (void)setComment:(NSString*)str ;
	
	- (intType)tag ;
	- (int)numberOfSegments ;
	- (double)wireRadius ;
	- (double)valueOfCoordinate1:(int)component ;
	- (double)valueOfCoordinate2:(int)component ;
	
	- (id)fieldForNumberOfSegments ;
	- (id)fieldForWireRadius ;
	- (id)fieldForCoordinate1:(int)component ;
	- (id)fieldForCoordinate2:(int)component ;

	- (const char*)evalDoubleAsString:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName ;
	- (const char*)evalDoubleAsStringExtended:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName ;
	- (double)evalDouble:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName ;
	- (int)evalInt:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName ;
	
	- (NSString*)stringFromMatrix:(NSMatrix*)matrix index:(int)index ;
	- (void)setMatrix:(NSMatrix*)matrix index:(int)index fromString:(NSString*)str ;
	
	- (void)addCell:(NSMatrix*)matrix at:(int)index toArray:(NSMutableArray*)array ;
	- (void)restoreCell:(NSMatrix*)matrix at:(int)j fromArray:(NSArray*)array index:(int)j ;

	//  save antenna geometry
	- (NSMutableDictionary*)makePlist ;
	- (NSMutableDictionary*)createGeometryForPlist ;
	
	//  a coordinate (for example) is stored in an NSArray that is a dictionary entry (e.g., coord1, coord2)
	- (NSArray*)arrayForMatrix:(NSMatrix*)matrix count:(int)n ;
	- (void)setMatrix:(NSMatrix*)matrix fromArray:(NSArray*)array count:(int)n ;
	
	- (void)releasePlist ;
	- (void)addExcitationToDict:(NSMutableDictionary*)dict ;
	- (void)restoreExcitation:(NSDictionary*)dict ;
	
	- (void)addLoadToDict:(NSMutableDictionary*)dict ;
	- (void)restoreLoad:(NSDictionary*)dict ;
	
	//  restore antenna geometry
	- (void)restoreGeometryFieldsFromDictionary:(NSDictionary*)dict ;
	- (void)restoreCommonGeometryFieldsFromDictionary:(NSDictionary*)dict ;
	
@end
