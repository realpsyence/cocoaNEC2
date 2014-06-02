//
//  GeometryView.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/3/07.

#import <Cocoa/Cocoa.h>
#import "PrintableView.h"
#import "OutputGeometryElement.h"
#import "OutputTypes.h"
#import "WireCurrent.h"

@class Output ;

@interface GeometryView : PrintableView {
	WireCurrent *wireCurrent ;	//  v0.81e
	NSMutableArray *arrayOfGeometryArrays, *feedpoints, *loads, *exceptions ;
	NSRect frame ;
	NSImage *hsvImage ;
	int currentType ;
	float azAngle, elAngle, zoom, panx, pany, printWidth ;
	GeometryOptions geometryOptions ;
	NSPoint mouseDownLocation ;
	NSCursor *savedCursor ;
	Output *client ;
	//	v0.75c
	NSAffineTransform *currentScale ;
	GeometryInfo *captionGeometryInfo ;
	int captionGeometryIndex ;					//  v0.81e
	GeometryInfo unitVectors[4] ;
}
- (void)updateWithArray:(NSArray*)array feedpoints:(NSArray*)feedpointArray loads:(NSArray*)loadArray exceptions:(NSArray*)exceptionArray options:(GeometryOptions*)options client:(Output*)output ;
- (void)refreshCurrents:(int)ctype azimuth:(float)az elevation:(float)el zoom:(float)zoomfactor options:(GeometryOptions*)options ;

- (void)setCurrentView:(WireCurrent*)view ;		//  v0.81e

- (void)clearPan ;

@end

#define	GEOMETRYNONE			0
#define	GEOMETRYCURRENT			1
#define	GEOMETRYPOWER			2
#define	GEOMETRYPHASE			3
#define	GEOMETRYRELATIVEPHASE	4
#define	GEOMETRYGRADIENT		5

