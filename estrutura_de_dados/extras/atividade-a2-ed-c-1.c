#include <stdlib.h>

/* Credits: Devwarlt */


/* define struct */
struct exemploStruct {
	int identificador;
	struct exemploStruct *ponteiroStruct;
};

int main(void) {
	/* instantiate struct & allocate on memory */
	struct exemploStruct* test;
	test = (struct exemploStruct*) malloc(sizeof(struct exemploStruct*));
	
	/* override properties & references */
	test->identificador = 123;
	test->ponteiroStruct = test;
	
	/* display values */
	printf("test->identificador: %d", test->identificador);
	printf("\ntest->ponteiroStruct->identificador: %d", test->ponteiroStruct->identificador);
	
	return EXIT_SUCCESS;
}
