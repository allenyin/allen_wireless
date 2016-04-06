#include "gettime.h"
#include <time.h>

long double g_startTime = 0.0;

long double gettime(){ /*in seconds!*/
	timespec pt ;
	clock_gettime(CLOCK_MONOTONIC_RAW, &pt);
	long double ret = (long double)(pt.tv_sec) ;
	ret += (long double)(pt.tv_nsec) / 1e9 ;
	return ret - g_startTime;
}

long double getrealtime() { // in milliseconds
    timespec pt;
    clock_gettime(CLOCK_REALTIME, &pt);
    long double ret = (long double)(pt.tv_sec) * 1000;
    ret += (long double)(pt.tv_nsec) / 1e6;
    return ret;
}
