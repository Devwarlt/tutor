#include "stdio.h"
#include "locale.h"
#include "static_queue.h"

int main() {
	setlocale(LC_ALL, "Portuguese");
	
	StaticQueue queue;
	int element;
	
	Init(&queue);
	
	AutoEnqueue(&queue);
	AutoDequeue(&queue);
}
