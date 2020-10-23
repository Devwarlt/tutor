/* define exit statuses */
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

/* define str buffer allocation for 'putf' ops */
#define STD_FMT_BUFFER 64

#include <iostream>
#include <cstdlib>
#include <cstdio>

/* Credits: Devwarlt */


/* define struct */
struct exemploStruct {
	int identificador;
	struct exemploStruct * ponteiroStruct;
};

/* assign pointers dynamically */
void f(struct exemploStruct * a, struct exemploStruct * b, struct exemploStruct * c) {
	b->ponteiroStruct = a;
	a->ponteiroStruct = c;
	c->ponteiroStruct = NULL;
}

/*
	Code: Nádio Dib "Devwarlt"
	Reference: Zhihao Yuan
	
	Overview:
		Printf defines the most widely used syntax to format a text output.
		It exists in C, Perl, Python and even Java™, and is available from
		Qt to Boost.Format[1], but not C++ standard library. This proposal
		tries to define such an interface based on the printf function
		defined by C[2] for the C++ I/O streams library, with the error
		handling policy and the type safety considered.
	
	Syntax:
		The syntax from printf in C is preserved as much as possible.
		
	Example:
		std::cout << putf("The answer:%2$*1$d\n", 5, 42);  // same effect
		
	Source:
		"A printf-like Interface for the Streams Library (revision 1)",
		available at http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2013/n3716.html
*/
template <typename T, typename... Types> 
std::string putf(T format, Types... args) {
	char buffer[STD_FMT_BUFFER];
	std::sprintf(buffer, format, args...);
	std::string fmt_str;
	fmt_str.assign(buffer);
	return fmt_str;
}

int main(void) {
	/* instantiate struct */
	struct exemploStruct a, b, c;
	
	/* override properties & references */
	a.identificador = 123;
	a.ponteiroStruct = NULL;
	
	f(&a, &b, &c);
	
	/* display values */
	std::cout << putf("a: %p", &a);
	std::cout << putf("\nb: %p", &b);
	std::cout << putf("\nc: %p", &c);
	std::cout << putf("\n---\na->identificador: %d\n---", a.identificador);
	std::cout << putf("\na->ponteiroStruct: %p", a.ponteiroStruct);
	std::cout << putf("\nb->ponteiroStruct: %p", b.ponteiroStruct);
	std::cout << putf("\nc->ponteiroStruct: %p", c.ponteiroStruct);
	
	std::exit(EXIT_SUCCESS);
}
