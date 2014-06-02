//
//  NC.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/15/07.


#import <Cocoa/Cocoa.h>
#import "NCBase.h"


@interface NC : NCBase <NSTableViewDataSource> {
	IBOutlet id window ;
	IBOutlet id textView ;
	IBOutlet id listView ;
	IBOutlet id outputView ;
	IBOutlet id cardsTable ;		// hollertith cards
	IBOutlet id ncTab ;
	
	IBOutlet id runButton ;
	IBOutlet id stopButton ;
	IBOutlet id progressIndicator ;
	
	//  autoindent
	NSString *newstring ;
	
	Boolean untitled ;
	Boolean dirty ;	
}

- (id)initWithDocumentNumber:(int)number untitled:(Boolean)isUntitled ;
- (NSString*)windowPosition ;

- (IBAction)run:(id)sender ;	
- (void)stop ;	

- (void)updateFromPath:(NSString*)path ;
- (NSString*)save:(Boolean)ask ;

- (void)becomeKeyWindow ;
- (void)setWindowPosition:(NSString*)pos ;
- (Boolean)windowCanClose ;

- (NECInfo*)necResults ;

- (void)appendToOutputView:(NSString*)str ;
- (void)saveToHollerith ;

- (NSString*)title ;
- (void)setTitle:(NSString*)title ;

- (int)documentNumber ;
- (Boolean)untitled ;


@end
