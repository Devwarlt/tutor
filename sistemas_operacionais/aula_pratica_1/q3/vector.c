#include <stdlib.h>
#include <math.h>
#include "vector.h"

/*
* implementation of the Vector API
*/

vector* vector_new(double x, double y, double z)
{
    vector* v = (vector*)malloc(sizeof(vector*));
    v->x = x;
    v->y = y;
    v->z = z;
    return v;
}

vector* vector_add(vector* a, vector* b)
{
    vector* v = (vector*)malloc(sizeof(vector*));
    v->x = a->x + b->x;
    v->y = a->y + b->y;
    v->z = a->z + b->z;
    return v;
}

vector* vector_sub(vector* a, vector* b)
{
    vector* v = (vector*)malloc(sizeof(vector*));
    v->x = a->x - b->x;
    v->y = a->y - b->y;
    v->z = a->z - b->z;
    return v;
}

vector* vector_scale(double factor, vector* v)
{
    v->x = v->x * factor;
    v->y = v->y * factor;
    v->z = v->z * factor;
    return v;
}

vector* vector_vprod(vector* a, vector* b)
{
    vector* v = (vector*)malloc(sizeof(vector*));
    v->x = a->x * b->x;
    v->y = a->y * b->y;
    v->z = a->z * b->z;
    return v;
}

double vector_sprod(vector* a, vector* b) { return a->x * b->x + a->y * b->y + a->z * b->z; }

double vector_mod(vector* v)
{
    double
        x = v->x,
        y = v->y,
        z = v->z;

    return sqrt(x * x + y * y + z * z);
}
