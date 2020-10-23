/*
	define a compiler variable to enable
 	debug verbose output
*/
#define ENABLE_DEBUG true

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <locale.h>

/* Credits: Devwarlt */


/* --[[START]]-- dynamic stack definition */

void ThrowException(char* exception, char* message, bool safeExit, char* name) {
	if (!exception)
		printf("\n[Undefined Exception]:\n\t[Pilha %s] %s\n", name, message);
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
		return '¢';
	}
	
	char value = stack->Peek->Value;
	struct Item *item = stack->Peek;
	stack->Peek = stack->Peek->Next;
	
	free(item); // release memory cache for specific pointer address
	
	if (ENABLE_DEBUG)
		printf("[Pop Event] > Removendo o elemento %c na pilha %s.\n", value, name);

	return value;
}

/* --[[ END ]]-- dynamic stack definition */

bool IsEquals(Stack *a, Stack *b) {
	if (ENABLE_DEBUG && IsEmpty(a)) {
		printf("[Equals Event] > Parâmetro *a (Stack) é vazia!");
		return false;
	}
		
	if (ENABLE_DEBUG && IsEmpty(b)) {
		printf("[Equals Event] > Parâmetro *b (Stack) é vazia!");
		return false;
	}
	
	Stack *ref1 = a, *ref2 = b, ref3, ref4;
	
	/* maintain stored values */
	Init(&ref3);
	Init(&ref4);
	
	char output;
	bool result;
	
	do {
		if (IsEmpty(ref1) && IsEmpty(ref2)) {
			result = true;
			break;
		}
		
		char output1 = Pop(ref1, "stack 1 ref");
		char output2 = Pop(ref2, "stack 2 ref");
		
		Push(&ref3, output1, "stack 1 ref [record]");
		Push(&ref4, output2, "stack 2 ref [record]");
		
		if (output1 != output2) {
			result = false;
			break;
		}
	} while (true);
	
	if (!IsEmpty(&ref3))
		do {
			char a_output = Pop(&ref3, "stack 1 ref [record]");
			Push(a, a_output, "stack 1 ref [record val]");
		} while(!IsEmpty(&ref3));
		
	if (!IsEmpty(&ref4))
		do {
			char b_output = Pop(&ref4, "stack 2 ref [record]");
			Push(b, b_output, "stack 2 ref [record val]");
		} while(!IsEmpty(&ref4));
	
	return result;
}

int main(void) {
	setlocale(LC_ALL, "Portuguese");
	
	/* declare stack variables */
	Stack s1, s2, s3;
	
	/* init stack variables */
	Init(&s1);
	Init(&s2);
	Init(&s3);
	
	/* push values to s1 stack */
	Push(&s1, '1', "stack 1");
	Push(&s1, '2', "stack 1");
	Push(&s1, '3', "stack 1");
	
	if (ENABLE_DEBUG)
		printf("---\n");
	
	/* push values to s2 stack */
	Push(&s2, '1', "stack 2");
	Push(&s2, '2', "stack 2");
	Push(&s2, '3', "stack 2");
	
	if (ENABLE_DEBUG)
		printf("---\n");
	
	/* push values to s3 stack */
	Push(&s3, '1', "stack 3");
	Push(&s3, '3', "stack 3");
	Push(&s3, '2', "stack 3");
	
	if (ENABLE_DEBUG)
		printf("---\n");
	
	printf("---\ns1 == s2? %s", IsEquals(&s1, &s2) ? "true" : "false");
	
	printf("\n---\n");
	
	printf("---\ns1 == s3? %s", IsEquals(&s1, &s3) ? "true" : "false");
	
	return EXIT_SUCCESS;
}
