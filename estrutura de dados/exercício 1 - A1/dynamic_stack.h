#define ENABLE_DEBUG true

#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"
#include "string.h"

void ThrowException(char* exception, char* message, bool safeExit, char* name) {
	if (!exception)
		printf("\n[Undefined Exception]:\n\t[Pilha %s] %s\n", name, exception, message);
	else
		printf("\n[%s Exception]:\n\t[Pilha %s] %s\n", exception, name, message);
	
	if (safeExit)
		exit(EXIT_FAILURE);
}

struct Item {
	char Value;
	struct Item *Next;
};

typedef struct {
	struct Item *Peek;
} Stack;

void Init(Stack *stack) {
	stack->Peek = NULL;
}

bool IsEmpty(Stack *stack) {
	return stack->Peek == NULL;
}

void Push(Stack *stack, char value, char* name) {
	struct Item *item = (struct Item*) malloc(sizeof(struct Item));
	item->Value = value;
	item->Next = stack->Peek;
	stack->Peek = item;
	
	if (ENABLE_DEBUG)
		printf("[Push Event] > Adicionando o elemento %c na pilha %s.\n", value, name);
}

char Pop(Stack *stack, char* name) {
	if (IsEmpty(stack)) {
		ThrowException("Stack Underflow", "A pilha está vazia!", false, name);
		return '.';
	}
	
	char value = stack->Peek->Value;
	struct Item *item = stack->Peek;
	stack->Peek = stack->Peek->Next;
	
	free(item); // release memory cache for specific pointer address
	
	if (ENABLE_DEBUG)
		printf("[Pop Event] > Removendo o elemento %c na pilha %s.\n", value, name);

	return value;
}

void AutoPush(Stack *stack, char* name) {
	printf("--- [Automatic Push Event] ---\n\n");
	
	char entries[10] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	
	for (int i = 0; i < sizeof(entries) / sizeof(entries[0]); i++)
		Push(stack, entries[i], name);
		
	printf("\n");
}

void AutoPop(Stack *stack, char* name) {
	printf("--- [Automatic Pop Event] ---\n\n");
	
	while (Pop(stack, name) != '.');
}
