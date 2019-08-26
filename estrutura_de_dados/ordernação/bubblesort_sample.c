#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"

int main(void) {
	int elements[10] = { 94, 23, 44, 34, 53, 69, 21, 56, 75, 78 }, element, i;
	int size = sizeof(elements)/sizeof(elements[0]);
	bool flag = false;
	
	printf("Bubble Sort method:\n\n");
	printf("Unsorted array is: ");
	
	for (i = 0; i < size; i++)
		printf("%i ", elements[i]);
	
	printf("\n--------------------------------\n");
	
	do {
		flag = true;
		for (i = 0; i < size - 1; i++)
			if (elements[i] > elements[i + 1]) {
				element = elements[i];
				elements[i] = elements[i + 1];
				elements[i + 1] = element;
				flag = false;
			}
	} while (!flag);
	
	printf("Sorted array is: ");
	
	for (i = 0; i < size; i++)
		printf("%i ", elements[i]);
		
	printf("\n");
	
	return EXIT_SUCCESS;
}
