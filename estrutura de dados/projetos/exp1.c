// https://www.tutorialspoint.com/cprogramming/c_error_handling.htm
// https://devdocs.io/c/error/errno
// https://devdocs.io/c/string/byte/strerror
// https://devdocs.io/c/io/perror
// https://devdocs.io/c/error/ignore_handler_s

#include "stdio.h"
#include "stdlib.h"
#include "errno.h"
#include "string.h"

char Method(void) {
	#ifdef __STDC_LIB_EXT1__
		set_constraint_handler_s(ignore_handler_s);
		set_constraint_handler_s(abort_handler_s);
	#endif
	
	char* text;
	
	printf("Normal string: ");
	printf("%s.\n", &"text");
	
	system("pause");
	
	printf("Null string: ");
	printf("%s.\n\n", text);
	
	return (char)EXIT_SUCCESS;
}

int main(void) {
	if (Method() == NULL)
		return EXIT_FAILURE;
	
	return EXIT_SUCCESS;
}
