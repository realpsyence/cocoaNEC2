//
//  NCBase.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/15/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NCCompiler.h"
#import "NCSystem.h"
#import "NECTypes.h"
#import "Versions.h"


enum LockCondition {
	kThreadBusy,
	kThreadFree
} ;

#define	MAXLINES	4000


@interface NCBase : NSObject <NSTableViewDataSource> {

	RuntimeStack stack ;

	NCCompiler *compiler ;
	NSConditionLock *runLock ;
	int runModelCount ;					//  v0.81d
	
	NSString *inputPath, *outputPath ;
	NECRadials necRadials ;
	NECInfo necResults ;
	int documentNumber ;
	NSMutableArray *hollerithArray ;
	NSTableColumn *hollerithCardColumn ;
		
	Boolean sendCardToNEC ;
	RunInfo runResult ;
	NSLock *nec2ThreadLock ;
	
	NSTableView *cardsView ;
}

- (void)appendText:(NSString*)string toView:(NSTextView*)view ;
- (void)outputListing:(NC*)client ;
- (void)makeListingViewVisible ;

- (NCSystem*)system ;
- (NCCompiler*)compiler ;
- (NECRadials*)necRadials ;

- (void)setModelFunction:(NCFunctionObject*)model ;
- (void)setSourcePath:(NSString*)path ;

- (void)setProgress:(Boolean)state ;

- (void)copyDeck:(NSArray*)deckArray ;
- (Boolean)outputHollerithToFile:(NSString*)filePath ;			// v0.55

- (Boolean)runModel ;
- (int)runWorkFlowCompile:(Boolean)doCompile execute:(Boolean)doExecute allowLoops:(Boolean)allowLoops runNEC:(Boolean)doRun sourceString:(NSString*)sourceString ;
- (void)processNEC2Output ;

@end
