#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"
#include "dynamic_stack.h"
#include "locale.h"

/*
	[Estrutura de Dados - Exercício]
	
	Nádio Dib - 201918579
	Engenharia de Software
*/

/*
	Escreva uma função que receba como parâmetro duas pilhas e verifique se elas são iguais.
	Duas pilhas são iguais se possuem os mesmos elementos, na mesma ordem.
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
	
	printf("As pilhas são iguais? %s", IsEqual(&stack1, &stack2) == true ? "\nSim, as pilhas são iguais." : "\nNão, as pilhas são diferentes.");
}
