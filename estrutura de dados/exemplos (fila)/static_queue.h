#include "stdio.h"
#include "string.h"
#include "stdbool.h"

#define QUEUE_LENGTH 10
#define EMPTY_QUEUE_ELEMENT -1
#define ENABLE_DEBUG true

typedef struct {
	int Elements[QUEUE_LENGTH], Peek, Last, Count;
} Queue;

void ThrowException(char* exception, char* message) {
	printf("\n[%s Exception]:\n\t%s\n", exception, message);
}

void Init(Queue *queue) {
	queue->Peek = 0;
	queue->Last = -1;
	queue->Count = 0;
}

bool IsEmpty(Queue *queue) {
	return queue->Count == 0;
}

bool Enqueue(Queue *queue, int element) {
	if (queue->Count == QUEUE_LENGTH) {
		ThrowException("Stack Overflow", "A fila atingiu a capacidade máxima!");
		return false;
	}
	
	queue->Count++;
	queue->Last = (queue->Last + 1) % QUEUE_LENGTH;
	queue->Elements[queue->Last] = element;
	
	if (ENABLE_DEBUG)
		printf("[Enqueue Event] > Adicionando o element %i na fila pos %i.\n", element, queue->Last);
		
	return true;
}

int Dequeue(Queue *queue) {
	if (IsEmpty(queue)) {
		ThrowException("Stack Underflow", "A fila está vazia!");
		return EMPTY_QUEUE_ELEMENT;
	}
	
	int element = queue->Elements[queue->Peek];
	queue->Count--;
	queue->Peek = (queue->Peek + 1) % QUEUE_LENGTH;
	
	if (ENABLE_DEBUG)
		printf("[Dequeue Event] > Removendo o element %i na fila pos %i.\n", element, queue->Peek);
		
	return element;
}

void AutoEnqueue(Queue *queue) {
	printf("--- [Automatic Enqueue Event] ---\n");
	
	int elements[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
	
	for (int i = 0; i < sizeof(elements) / sizeof(elements[0]); i++)
		Enqueue(queue, elements[i]);
		
	printf("\n");
}

void AutoDequeue(Queue *queue) {
	printf("--- [Automatic Dequeue Event] ---\n");
	
	while (Dequeue(queue) != EMPTY_QUEUE_ELEMENT);
}
