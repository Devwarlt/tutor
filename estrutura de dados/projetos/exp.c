#include "stdio.h"
#include "stdlib.h"
#include "setjmp.h"

#include "string.h"
#include "stdbool.h"
#include "assert.h"
#include "math.h"

#include "signal.h"

/*
 References:
 https://embeddedartistry.com/blog/2018/5/7/cexception-simple-exception-handling-in-c
 https://github.com/ThrowTheSwitch/CException
 http://www.throwtheswitch.org/cexception
 http://www.throwtheswitch.org/
 https://stackoverflow.com/questions/2891766/how-to-throw-an-exception-in-c
 https://devdocs.io/c/program/signal
 https://devdocs.io/c/error
*/

/*
#define try do { if(!setjmp(ex_buf__)) {
#define catch exit(0); } else {
#define finally } } while (true);
#define throw printf("An error occurred! Throwing exception...\n"); longjmp(ex_buf__, 1); exit(1);
#define Exception printf
*/

void signal_handler(int signal)
{
    printf("Received signal %d\n", signal);
}

static jmp_buf buffer;

int Exception() {
	char* test;
	
	do {
		if (!setjmp(buffer)) {
			printf("Normal string: ");
			printf("%s.\n", &"teste");
			
			system("pause");
			
			printf("Buggy string: ");
			printf("%s.\n\n", test);
			
			return 0;
		}
		else {
			longjmp(buffer, 1);
			
			printf("[Code Exception] An error occurred!\n");
			
			break;
		}
		
	} while (true);
	
	return 1;
}

int main(void) {
	printf("Function result: %i.", Exception());
	
	/* Install a signal handler. */
    /*if (signal(SIGTERM, signal_handler) == SIG_ERR)
    {
        printf("Error while installing a signal handler.\n");
        exit(EXIT_FAILURE);
    }
    
    printf("Sending signal %d\n", SIGTERM);
    
    if (raise(SIGTERM) != 0)
    {
        printf("Error while raising the SIGTERM signal.\n");
        exit(EXIT_FAILURE);
    }
 
    printf("Exit main()\n");
    
    return EXIT_SUCCESS;*/
}
