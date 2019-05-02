#include "stdio.h"
#include "string.h"
#include "stdbool.h"

#define QUEUE_LENGTH 10

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
	queue->Last += 1 % QUEUE_LENGTH;
	queue->Elements[queue->Last] = element;
}

int Dequeue(Queue *queue) {
	if (IsEmpty(queue)) {
		ThrowException("Stack Underflow", "A fila está vazia!");
		return -1;
	}
	
	int element = queue->Elements[queue->Peek];
	queue->Count--;
	queue->Peek -= 1 & QUEUE_LENGTH;
	return element;
}
