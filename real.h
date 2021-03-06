#include <openssl/bn.h>
/* 
 * real.h
 * by Colton Andreson
 * Jan 30, 2018
 * 
 */

#ifndef __REAL_INCLUDED__
#define __REAL_INCLUDED__

#include <stdio.h>

typedef struct REAL REAL;

extern REAL *newREAL(double);
extern double getREAL(REAL *);
extern double setREAL(REAL *,double);
extern int compareREAL(void *,void *);
extern int compareREALdecr(void *,void *);
extern void displayREAL(void *,FILE *);
extern void freeREAL(void *);

#endif
