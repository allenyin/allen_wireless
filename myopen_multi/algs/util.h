#ifndef _UTIL_H_
#define _UTIL_H_

#include "matrix.h"

/* $Id: util.h 84 2008-07-30 11:35:10Z joseph.odoherty $ */


#define warn(s)         print_err(s,0);
#define fatal(s)        print_err(s,1);

void print_err(char * s, int quit);
matrix * readMatrixFromBinaryFile(char * f);

#endif
