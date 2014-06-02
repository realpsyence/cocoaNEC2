/*
 *  RuntimeStack.h
 *  cocoaNEC
 *
 *  Created by Kok Chen on 9/21/07.
 *
 */

	@class NCSystem ;
	
	typedef struct {
		NSMutableArray *commentDeck ;
		NSMutableArray *geometryElements ;
		NSMutableArray *releasableObjects ;
		NSMutableArray *controlDeck ;
		NSMutableArray *exceptions ;
		NSMutableArray *errors ;
		NSString *sourcePath ;
		NSMutableArray *coaxLines ;	//  v0.77
		NCSystem *system ;
	} RuntimeStack ;

