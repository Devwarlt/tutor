#include "stdio.h"
#include "stdlib.h"
#include "setjmp.h"

void ExceptionSample(void) {
	jmp_buf buf;
	
	if (setjmp(buf) == 0) {
		if (1) {
			
		} else {
			
		}
	}
	else {
		longjmp(buf, 1);
		
		printf("An error occurred!");
	}
}

int main(void) {
	
}
