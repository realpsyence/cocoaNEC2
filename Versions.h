//
//  Versions.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/6/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>


#define BuildForSnowLeopard	( MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5 )
//#define BuildForSnowLeopard	0


#if ( MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5 )
#define	intType	NSInteger
#else
#define	intType int
#endif



#if ( MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5 )
#define	floatType	CGFloat
#else
#define	floatType float
#endif


