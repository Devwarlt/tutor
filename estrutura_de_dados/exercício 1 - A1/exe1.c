#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"
#include "dynamic_stack.h"
#include "locale.h"

/*
	[Estrutura de Dados - Exerc�cio]
	
	N�dio Dib - 201918579
	Engenharia de Software
*/

/*
	Escreva uma fun��o que receba como par�metro duas pilhas e verifique se elas s�o iguais.
	Duas pilhas s�o iguais se possuem os mesmos elementos, na mesma ordem.
*/

bool IsEqual(Stack *stack1, Stack *stack2) {
	char tempVal1 = '.', tempVal2 = '.';
	bool isEqual = false;
	
	while (tempVal1 != '.' && tempVal2 != '.') {
		tempVal1 = Pop(stack1, "1");
		tempVal2 = Pop(stack2, "2");
		isEqual = tempVal1 && tempVal2;
		
		if (!isEqual)
			break;
	}
	
	return isEqual;
}

int main() {
	setlocale(LC_ALL, "Portuguese");
	
	Stack stack1, stack2;
	
	Init(&stack1);
	Init(&stack2);
	
	AutoPush(&stack1, "1");
	AutoPush(&stack2, "2");
	
	printf("As pilhas s�o iguais? %s", IsEqual(&stack1, &stack2) == true ? "\nSim, as pilhas s�o iguais." : "\nN�o, as pilhas s�o diferentes.");
}
