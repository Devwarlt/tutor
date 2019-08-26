/*
  Try / Catch block exceptions for C language, this feature still work in progress and aim for academic & testing purposes.
  
  -- Lambda expression in C
  [1]. https://blog.noctua-software.com/c-lambda.html

  -- Try / catch block in C
  [1]. https://stackoverflow.com/questions/10586003/try-catch-statements-in-c
  [2]. http://www.di.unipi.it/~nids/docs/longjump_try_trow_catch.html
*/

#include "stdio.h"
#include "stdlib.h"
#include "setjmp.h"

static jmp_buf ex_buf__;

#define try do { if(!setjmp(ex_buf__)) {
#define catch exit(0); } else {
#define finally } } while (true);
#define throw printf("An error occurred! Throwing exception...\n"); longjmp(ex_buf__, 1); exit(1);
#define Exception printf