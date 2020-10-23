#include <stdlib.h>
#include <stdio.h>

/* Credits: Devwarlt */


/* define struct */
struct exemploStruct {
	int identificador;
	struct exemploStruct *ponteiroStruct;
};

/* assign pointers dynamically */
void f(struct exemploStruct *a, struct exemploStruct *b, struct exemploStruct *c) {
	b->ponteiroStruct = a;
	a->ponteiroStruct = c;
	c->ponteiroStruct = NULL;
}

int main(void) {
	/* instantiate struct & allocate on memory */
	struct exemploStruct *a, *b, *c;
	a = (struct exemploStruct*) malloc(sizeof(struct exemploStruct*));
	b = (struct exemploStruct*) malloc(sizeof(struct exemploStruct*));
	c = (struct exemploStruct*) malloc(sizeof(struct exemploStruct*));
	
	/* override properties & references */
	a->identificador = 123;
	a->ponteiroStruct = NULL;
	
	f(a, b, c);
	
	/* display values */
	printf("a: %p", a);
	printf("\nb: %p", b);
	printf("\nc: %p", c);
	printf("\n---\na->identificador: %d\n---", a->identificador);
	printf("\na->ponteiroStruct: %p", a->ponteiroStruct == NULL ? "null" : a->ponteiroStruct);
	printf("\nb->ponteiroStruct: %p", b->ponteiroStruct == NULL ? "null" : b->ponteiroStruct);
	printf("\nc->ponteiroStruct: %p", c->ponteiroStruct == NULL ? "null" : c->ponteiroStruct);
	
	return EXIT_SUCCESS;
}
