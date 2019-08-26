#include "stdio.h"
#include "stdlib.h"
#include "dynamic_stack.h"
#include "locale.h"

/*
	[Estrutura de Dados - Exerc�cio]
	
	N�dio Dib - 201918579
	Engenharia de Software
*/

/*
	Escreva uma fun��o que receba um vetor com v�rios elementos e um ponteiro para uma pilha.
	Preencha a pilha passada como par�metro com os elementos do vetor.
*/

void PushArray(Stack *stack, char *array, int length) {
	for (int i = 0; i < length - 1; i++)
		Push(stack, array[i], "exemplo");
}

int main() {
	setlocale(LC_ALL, "Portuguese");
	
	Stack stack;
	char values[10] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i' };
	
	PushArray(&stack, values, sizeof(values) / sizeof(values[0]));
}
