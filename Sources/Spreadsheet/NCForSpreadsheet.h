//
//  NCForSpreadsheet.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/16/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCBase.h"
#import "Versions.h"

@interface NCForSpreadsheet : NCBase <NSTableViewDataSource> {

	NSString *sourceString ;
	NSTextView *listView ;
	int runStatus ;
}

- (id)initWithListView:(NSTextView*)view cardView:(NSTableView*)cards ;
- (void)runSource:(NSString*)source ;
- (void)createDeck:(NSString*)source ;

@end
