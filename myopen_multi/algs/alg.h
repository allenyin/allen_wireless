#ifndef _ALG_H
#define _ALG_H

/* $Id: alg.h 84 2008-07-30 11:35:10Z joseph.odoherty $ */

void get_weights(matrix *X, matrix *Y, matrix *B);
void applyWeights(matrix * X, matrix * w, matrix * yhat);
void correlate(matrix * y_truth, matrix * y_hat, matrix * r2);

#endif
