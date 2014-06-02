/*
 *  pdfconsumer.m
 *  NEC2 Cocoa
 *
 *  Created by kchen on Thu Jun 06 2002.
 *  Copyright (c) 2002 W7AY. All rights reserved.
 *
 */

#import "pdfconsumer.h"

//  Class for PDF Consumers in CG.

@implementation PDFConsumer

//  create pdf consumer in the form of a file
- (id)initWithFilename:(char*)filename width:(float)width height:(float)height
{
	self = [ super init ] ;
	if ( self ) {
		context = nil ;
		[ self createFromName:filename width:width height:height ] ;
	}
	return self ;
}

//  associate pdf consumer to an an existing CG Context
- (id)initWithContext:(CGContextRef)ref width:(float)width height:(float)height
{
	self = [ super init ] ;
	if ( self ) {
		box.origin.x = box.origin.y = 0 ;
		box.size.width = width ;
		box.size.height = height ;
		xscale = yscale = 1.0 ;
		context = ref ;
	}
	return self ;
}

/*
- (void)release
{
    if ( context ) CGContextRelease( context ) ;
}
*/

- (void)createFromName:(char*)filename width:(float)width height:(float)height
{
    CFURLRef url ;
    CGDataConsumerRef dataConsumer ;
    CFStringRef cffilename ;
    
    box.origin.x = box.origin.y = 0 ;
    box.size.width = width ;
    box.size.height = height ;
    
    xscale = yscale = 1.0 ;

    context = nil ;	
    cffilename = CFStringCreateWithCString( nil, filename, kCFStringEncodingMacRoman ) ;
    url = CFURLCreateWithFileSystemPath( nil, cffilename, kCFURLPOSIXPathStyle, false ) ;
    if ( url ) {
        dataConsumer = CGDataConsumerCreateWithURL( url ) ;
        if ( dataConsumer ) {
            context = CGPDFContextCreate( dataConsumer, &box, nil ) ;
            CGDataConsumerRelease( dataConsumer ) ;
        }
    }
}

- (void)beginpage
{
	CGContextBeginPage( context, &box ) ; 
}

- (void)endpage
{
	CGContextEndPage( context ) ; 
}

- (CGRect*)rect
{ 
	return &box; 
}

- (float)size
{ 
	return box.size.width ; 
}

- (float)xsize
{ 
	return box.size.width ; 
}

- (float)ysize
{ 
	return box.size.height ; 
}

- (void)setdash:(float)phase length:(float)w
{
    floatType lengths[1] ;
    
    lengths[0] = w ;
    CGContextSetLineDash( context, phase, lengths, 1 ) ;
}

- (void)setunequaldash:(float)phase on:(float)w off:(float)z
{
    floatType lengths[2] ;
    
    lengths[0] = w ;
	lengths[1] = z ;
    CGContextSetLineDash( context, phase, lengths, 2 ) ;
}


- (void)setlinewidth:(float)width
{
	CGContextSetLineWidth( context, width ) ; 
}

- (void)setfont:(char*)name size:(float)size
{ 
	CGContextSelectFont( context, name, size, kCGEncodingMacRoman ) ; 
}

- (void)setfill
{
	CGContextSetTextDrawingMode( context, kCGTextFill ) ; 
}

- (void)setstrokefill
{
	CGContextSetTextDrawingMode( context, kCGTextFillStroke ) ; 
}

- (void)show:(char*)text x:(float)x y:(float)y
{ 
	CGContextShowTextAtPoint( context, x, y, text, strlen( text ) ) ; 
}

- (void)show:(char*)text
{
	CGContextShowTextAtPoint( context, 0.0, 0.0, text, strlen( text ) ) ; 
}

- (void)scale:(float)sx 
{
	CGContextScaleCTM( context, sx, sx ) ; 
	xscale *= sx ; 
	yscale *= sx ;
}

- (void)scale:(float)sx y:(float)sy
{
	CGContextScaleCTM( context, sx, sy ) ; 
	xscale *= sx ;
	yscale *= sy ; 
}

- (void)translate:(float)tx y:(float)ty
{ 
	CGContextTranslateCTM( context, tx, ty ) ; 
}

- (void)rotate:(float)phi
{
	CGContextRotateCTM( context, phi) ; 
}

- (void)concat:(float)a b:(float)b c:(float)c d:(float)d e:(float)e f:(float)f
{ 
    CGAffineTransform t ;
    
    t.a = a ;
    t.b = b ;
    t.c = c ;
    t.d = d ;
    t.tx = e ;
    t.ty = f ;
    CGContextConcatCTM( context, t ) ; 
}

- (void)setmatrix:(float)a b:(float)b c:(float)c d:(float)d e:(float)e f:(float)f
{ 
    // implement as concat
    [ self concat:a b:b c:c d:d e:e f:f ] ;
}

- (void)save
{
	CGContextSaveGState( context ) ; 
}

- (void)restore
{
	CGContextRestoreGState( context ) ; 
}

- (void)moveto:(float)x y:(float)y
{
	CGContextMoveToPoint( context, px = x, py = y ) ; 
}

//- (void)moveto:(PlotCoord*)c
//{
//	CGContextMoveToPoint( context, px = c->x, py = c->y ) ; 
//}

- (void)lineto:(float)x y:(float)y
{	
	CGContextAddLineToPoint( context, px = x, py = y ) ; 
}

//- (void)lineto:(PlotCoord*)c
//{	
//	CGContextAddLineToPoint( context, px = c->x, py = c->y ) ; 
//}

- (void)rlineto:(float)x y:(float)y
{
	CGContextAddLineToPoint( context, px += x, py += y ) ; 
}

//- (void)rlineto:(PlotCoord*)c
//{
//	CGContextAddLineToPoint( context, px += c->x, py += c->y ) ; 
//}

- (void)curveto:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 x3:(float)x3 y3:(float)y3
{
	CGContextAddCurveToPoint( context, x1, y1, x2, y2, x3, y3 ) ; 
}

//  v0.70 Quadratic Bezier, with x2,y2 as control point
- (void)quadthrough:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 x3:(float)x3 y3:(float)y3
{
	[ self moveto:x1 y:y1 ] ;
	[ self curveto:( x1+x2*2 )/3 y1:( y1+y2*2 )/3 x2:( x3+x2*2 )/3 y2:( y3+y2*2 )/3  x3:x3 y3:y3 ] ;
}

//  v0.70 quadratic through points
- (void)quad:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 x3:(float)x3 y3:(float)y3 scale:(float)s
{
	[ self quadthrough:x1*s y1:y1*s x2:(2*x2-(x1+x3)*0.5)*s y2:(2*y2-(y1+y3)*0.5)*s x3:x3*s y3:y3*s ] ;
}

static void arc( CGContextRef context, float x, float y, float r, float t0, float t1 )
{
	CGContextAddArc( context, x, y, r, t0, t1, 0 ) ; 
}

static float determinant( float a, float b, float c, float d, float e, float f, float g, float h, float i )
{
	return ( a*(e*i-h*f) - d*(b*i-h*c) + g*(b*f-e*c) ) ;
}

//  v0.70 find shorter span for clockwise (1) or anticlockwise (0)
static int shortDirection( float start, float end ) 
{
	//  "rotate" start to 0
	end -= start ;
	if ( end > 2*3.1415926 ) end -= 2*3.1415926 ;
	if ( end < 0 ) end += 2*3.1415926 ;
	
	if ( end >= 3.4159256/2 && end < 3.1415926*3/2 ) return -1 ;
	
	//  check if end is less than or greater than 180 degrees
	return ( ( end > 3.1415926 ) ? 1 : 0 ) ;
}

//	Draw arc defined by three points
//	see http://mathworld.wolfram.com/Circle.html
- (void)arcthrough:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 x3:(float)x3 y3:(float)y3 firstSegment:(Boolean)firstSegment
{
	float a, d, e, f, z1, z2, z3, cx, cy, r, radius, start, end ;
	int direction ;
	
	z1 = x1*x1 + y1*y1 ;
	z2 = x2*x2 + y2*y2 ;
	z3 = x3*x3 + y3*y3 ;
	
	a = determinant( x1, y1, 1, x2, y2, 1, x3, y3, 1 ) ;
	d = -determinant( z1, y1, 1, z2, y2, 1, z3, y3, 1 ) ;
	e = determinant( z1, x1, 1, z2, x2, 1, z3, x3, 1 ) ;
	f = -determinant( z1, x1, y1, z2, x2, y2, z3, x3, y3 ) ;
	
	// center and radius
	cx = -d*0.5/a ;
	cy = -e*0.5/a ;
	r = (d*d+e*e)/(4*a*a) - f/a ;
	if ( r <= 0 ) return ;
	radius = sqrt( r ) ;
	
	end =  atan2( y2-cy, x2-cx ) ;
	start = ( firstSegment ) ? atan2( y1-cy, x1-cx ) : atan2( y3-cy, x3-cx ) ;
	direction = shortDirection( start, end ) ;
	if ( direction < 0 ) return ;	//  likely poor estimate
	CGContextAddArc( context, cx, cy, radius, start, end, direction ) ;
}

//  v0.70 draw arc through (x1,y1), (x2,y2), (x3,y3)
- (void)arcthrough:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 x3:(float)x3 y3:(float)y3 scale:(float)s firstSegment:(Boolean)firstSegment
{
	[ self arcthrough:x1*s y1:y1*s x2:x2*s y2:y2*s x3:x3*s y3:y3*s firstSegment:firstSegment ] ;
}

- (void)circle:(float)r
{
	[ self circle:r x:0.0 y:0.0 ] ;
}

- (void)circle:(float)r x:(float)x y:(float)y 
{ 
	arc( context, x, y, r, 0.0, 3.1415925*2 ) ; 
}

- (void)arc:(float)x y:(float)y r:(float)r t0:(float)t0 t1:(float)t1
{
	arc( context, x, y, r, t0, t1 ) ;
}

- (void)arcn:(float)r x:(float)x y:(float)y t0:(float)t0 t1:(float)t1
{
	CGContextAddArc( context, x, y, r, t0, t1, 1 ) ; 
}

- (void)rect:(float)x y:(float)y width:(float)width height:(float)height
{
    CGRect rect ;
    
    rect.origin.x = x ;
    rect.origin.y = y ;
    rect.size.width = width ;
    rect.size.height = height ;

    CGContextAddRect( context, rect ) ;
}

- (void)newpath
{
	CGContextBeginPath( context ) ;
}

- (void)closepath
{
	CGContextClosePath( context ) ; 
}

- (void)stroke
{
	CGContextStrokePath( context ) ;
}

- (void)closepath_stroke
{
	CGContextClosePath( context ) ; 
	CGContextStrokePath( context ) ; 
}

- (void)fill
{
	CGContextFillPath( context ) ; 
}

- (void)clip
{
	CGContextClip( context ) ; 
}

- (void)setgrayfill:(float)gray
{
	CGContextSetGrayFillColor( context, gray, 1.0 ) ; 
}

- (void)setgraystroke:(float)gray
{
	CGContextSetGrayStrokeColor( context, gray, 1.0 ) ; 
}

- (void)setrgbfillcolor:(float)red green:(float)green blue:(float)blue
{
	CGContextSetRGBFillColor( context, red, green, blue, 1.0 ) ; 
}

- (void)setrgbstrokecolor:(float)red green:(float)green blue:(float)blue
{
	CGContextSetRGBStrokeColor( context, red, green, blue, 1.0 ) ; 
}

- (void)setRGBColor:(float)r g:(float)g b:(float)b
{
    CGContextSetRGBFillColor( context, r, g, b, 1.0 ) ;
    CGContextSetRGBStrokeColor( context, r, g, b, 1.0 ) ;
}

- (void)setRGBColor:(float)r g:(float)g b:(float)b alpha:(float)a
{
    CGContextSetRGBFillColor( context, r, g, b, 1.0 ) ;
    CGContextSetRGBStrokeColor( context, r, g, b, a ) ;
}

- (void)setRGB:(NSColor*)rgb
{
	floatType r, g, b, a ;
	
	[ rgb getRed:&r green:&g blue:&b alpha:&a ] ;
    CGContextSetRGBFillColor( context, r, g, b, 1.0 ) ;
    CGContextSetRGBStrokeColor( context, r, g, b, 1.0 ) ;
}

@end




