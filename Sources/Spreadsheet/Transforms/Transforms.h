//
//  Transforms.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "TransformObject.h"
#import "Versions.h"

typedef struct {
	double rotateX ;
	double rotateY ;
	double rotateZ ;
	double translateX ;
	double translateY ;
	double translateZ ;
} TransformStruct ;


@interface Transforms : NSObject <NSComboBoxDataSource> {

	IBOutlet id table ;		// table view
	IBOutlet id window ;
	
	NSMutableArray *transformArray ;		//  array of array of (rx, ry, rz, tx, ty, tz)
	NSMutableDictionary *dictionary ;
	NSMutableArray *plist ;
	int rows ;
	
	NSTableColumn *nameColumn, *transformColumn[6] ;
	id delegate ;
	
	NSWindow *controllingWindow ;
}

- (IBAction)addTransform:(id)sender ;
- (IBAction)removeTransform:(id)sender ;

- (IBAction)closeSheet:(id)sender ;
- (void)showSheet:(NSWindow*)controllingWindow ;

- (NSArray*)transformList ;
- (void)validate ;

- (void)setDelegate:(id)client ;
- (void)deselectAll ;

- (NSMutableArray*)makePlist ;
- (void)releasePlist ;
- (void)restoreFromArray:(NSArray*)items ;

//	Lookup
- (NSArray*)transformForName:(NSString*)name ;

@end
