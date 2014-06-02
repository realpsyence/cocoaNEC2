//
//  TwoPort.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/12/07.

	#import <Cocoa/Cocoa.h>
	
	@class Expression ;
	@class ElementGeometry ;
	@class Spreadsheet ;

	@interface TwoPort : NSObject {
		IBOutlet id window ;
		IBOutlet id typeTab ;
		
		//  Transmission line
		IBOutlet id tlLocation1Matrix ;
		IBOutlet id tlLocation1Segment ;
		IBOutlet id tlAdmittance1Matrix ;
		IBOutlet id tlLocation2Matrix ;
		IBOutlet id tlLocation2Segment ;
		IBOutlet id tlAdmittance2Matrix ;
		IBOutlet id tlMatrix ;
		IBOutlet id tlCrossedButton ;
		
		//  Network
		IBOutlet id ntLocation1Matrix ;
		IBOutlet id ntLocation1Segment ;
		IBOutlet id ntLocation2Matrix ;
		IBOutlet id ntLocation2Segment ;
		IBOutlet id ntAdmittanceMatrix ;
		
		
		id delegate ;
		int selectedType ;
		Boolean opened ;					// to distingished between closed and hidden
		Boolean ignore ;
		
		Spreadsheet *spreadsheet ;
		int networkRow ;
		NSString *card ;		
		NSString *from, *to, *comment ;
	}

	- (id)initWithDelegate:(id)client type:(int)type ;
	- (id)initFromDict:(NSDictionary*)dict delegate:(id)client type:(int)type ;
	
	- (void)openInspector:(id)client ;
	- (void)bringToFront ;
	- (void)hideWindow ;
	- (void)showWindow ;
	- (Boolean)opened ;
	- (Boolean)ignoreCard ;
	
	- (ElementGeometry*)getElementGeometry:(NSString*)str row:(int)row type:(char*)type ;
	
	- (Boolean)ncCode:(NSMutableString*)code eval:(Spreadsheet*)spreadsheet networkRow:(int)row ;
	- (NSString*)networkCard:(Expression*)e spreadsheet:(Spreadsheet*)spreadsheet networkRow:(int)row ;		//  deprecated
	
	- (NSString*)fromField ;
	- (void)setFrom:(NSString*)str ;
	- (NSString*)typeField ;
	- (NSString*)toField ;
	- (void)setTo:(NSString*)str ;
	- (NSString*)commentField ;
	- (void)setComment:(NSString*)str ;
	- (NSString*)ignoreField ;
	- (void)setIgnore:(NSString*)str ;

	- (const char*)evalDoubleAsString:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName ;
	- (const char*)evalDoubleAsString:(NSMatrix*)matrix row:(int)row cellName:(char*)cellName negate:(Boolean)negate ;
	- (int)segmentNumberForWire:(ElementGeometry*)wire matrix:(NSMatrix*)locationMatrix segmentField:(NSTextField*)segment ;
	
	- (NSMutableDictionary*)makePlistDictionary ;
	- (void)restoreFromDictionary:(NSDictionary*)dict ;
	
	#define	NETWORKTYPE				0
	#define	TRANSMISSIONLINETYPE	1
	#define	OTHERTYPE				2


	@end
