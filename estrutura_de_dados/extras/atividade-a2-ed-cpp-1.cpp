#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

#include <iostream>
#include <cstdlib>

/* Credits: Devwarlt */


/* define struct */
struct exemploStruct {
	int identificador;
	struct exemploStruct * ponteiroStruct;
};

int main(void) {
	/* instantiate struct */
	struct exemploStruct test;
	
	/* override properties & references */
	test.identificador = 123;
	test.ponteiroStruct = &test;
	
	/* display values */
	std::cout << "test.identificador: " << test.identificador;
	std::cout << "\ntest.ponteiroStruct->identificador: " << test.ponteiroStruct->identificador;
	
	std::exit(EXIT_SUCCESS);
}
