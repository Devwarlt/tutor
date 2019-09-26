#include "stdio.h"
#include "stdbool.h"
#include "stdlib.h"
#include "dynamic_stack.h"
#include "locale.h"
#include "string.h"

void Menu(Stack *stack) {
	int i = 0, aopCount = 0, acpCount = 0;
	char formula[60], aop = '(', acp = ')';
	
	printf("--- EXERCÍCIO 3 (Lista 2) ---\n\n");
	printf("Digite a expressão: ");
	
	scanf("%s", &formula);
	
	for (int i = 0; i < strlen(formula); i++)
		if (formula[i] == aop || formula[i] == acp)
			Push(stack, formula[i], "contador");
			
			
	if (strlen(formula) == 0 || IsEmpty(stack)) {
		ThrowException("Invalid Expression", "Expressão inválida!", false, "contador");
		Menu(stack);
		return;
	}
	
	char current;
	
	do {
		current = Pop(stack, "contador");
		
		if (current == aop)
			aopCount++;
		
		if (current == acp)
			acpCount++;
	} while (current != '.');
	
	if (aopCount > acpCount)
		ThrowException("Invalid Expression", "Falta fechar parênteses!", false, "contador");
				
	if (aopCount < acpCount)
		ThrowException("Invalid Expression", "Falta abrir parênteses!", false, "contador");
		
	if (aopCount == acpCount)
		printf("\n\nExpressão correta!\n");
	
	printf("\n'(': %i | ')': %i\n", aopCount, acpCount);
	
	system("pause");
	system("cls");
	
	Menu(stack);
}

int main() {
	setlocale(LC_ALL, "Portuguese");
	
	Stack stack;
	
	Init(&stack);
	
	Menu(&stack);
}