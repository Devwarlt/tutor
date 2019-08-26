#include "unity.h"
#include "CException.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int main(void) {
	CEXCEPTION_T e;
	
	Try {
		char* text;
		
		printf("Normal text: ");
		printf("'%s'.\n", &"not null string");
		
		system("pause");
		
		printf("Null text: ");
		printf("'%s'.\n", &text);
	}
	Catch(e) {
		printf("[Exception] An error occurrer!");
	}
	
	return EXIT_SUCCESS;
}
