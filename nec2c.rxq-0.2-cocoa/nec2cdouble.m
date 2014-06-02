/*
 *  nec2cdouble.c
 *  cocoaNEC
 *
 *  Created by Kok Chen on 7/30/07.
 */



#include <complex.h>

#define DOUBLE		// define DOUBLE to use double precision, otherwise use extended double precision kc
typedef double doubletype ;
typedef double complex complextype ;
#define	stopproc( flag )	stopnec( flag )
//  define as creal() for double precision
#define	crealx( v )			( creal( v ) )
#define	cimagx( v )			( cimag( v ) )


#include "nec2common.m"

