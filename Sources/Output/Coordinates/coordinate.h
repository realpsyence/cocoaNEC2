/*
 *  coordinates.h
 *  cocoaNEC
 *
 *  Created by Kok Chen on 9/2/07.
 */

    typedef struct {
        float x ;
        float y ;
        float z ;
		float u ;		//  uvw are used for transformed values of xyz
		float v ;
		float w ;
		float u0 ;
		float v0 ;
		float w0 ;
    } Coordinate ;

