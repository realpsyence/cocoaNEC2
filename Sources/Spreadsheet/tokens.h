/*
 *  tokens.h
 *  NEC2 Cocoa
 *
 *  Created by Kok Chen on 1/3/05.
 *  Copyright 2005 W7AY. All rights reserved.
 *
 */

#ifndef _TOKENS_H_ 
	#define _TOKENS_H_ 

    //  symbols start with 0x1000 (-Wno-four-char-constants)
    #define tok_EOF			0
    #define tok_NOP			'nop '
    #define tok_STR			'str '
    #define tok_COMMA		'coma'
    #define tok_SEMI		'semi'
    #define tok_LPAR		'lpar'
    #define tok_RPAR		'rpar'
    #define tok_LBRC		'lbrc'
    #define tok_RBRC		'rbrc'
    #define tok_ASGN		'asgn'
    #define tok_EQ			'eq  '
    #define tok_REALC		'rc  '
    #define tok_INTC		'ic  '
    #define tok_ADD			'add '
    #define tok_SUB			'sub '
    #define tok_MUL			'mul '
    #define tok_DIV			'div '
    #define tok_MOD			'mod '
    #define tok_INCR		'incr'
    #define tok_DECR		'decr'
    #define tok_CMNT		'cmnt'
    #define tok_LT			'lt  '
    #define tok_GT			'gt  '
    #define tok_LE			'le  '
    #define tok_GE			'ge  '
    #define tok_NE			'ne  '
    
    #define tok_NOT			'not ' // unused
    
    #define tok_head		'head' 
    #define tok_real		'real' 
    #define tok_void		'void' 
    #define tok_int			'int ' 
    #define tok_model		'modl' 
    #define tok_cards		'card' 	// NEC-2 cards
    #define tok_for			'for ' 
    #define tok_while		'whle' 
    #define tok_if			'if  ' 
    #define tok_else		'else' 
    #define tok_line		'line' 
    #define tok_coord		123456 
    
    #define tok_ERR			'errt'
	//  used by expression evaluator
	#define	tok_SPACE		'spce'
	#define	tok_NUMBER		'num '
	#define	tok_IDENT		'idnt'
	#define	tok_POUND		'poun'
	#define	tok_FOOT		'foot'
	#define	tok_INCH		'inch'
	#define	tok_EXPR		'expr'
	#define	tok_FUNC		'func'
    
    #define type_INT		54
    #define type_REAL		55
    #define type_VOID		56
    #define type_ENTRY		57
    #define type_LINE		58
    #define type_COORD		59
    
    #define class_KEYW		83
    #define class_GLOB		84
    #define class_LOCL		85
    #define class_FUNC		86
    #define class_LIB		87

#endif
