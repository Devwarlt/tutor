/* define exit statuses */
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

/* define str buffer allocation for 'putf' ops */
#define STD_FMT_BUFFER 64

/*
	define a compiler variable to enable
 	debug verbose output
*/
#define ENABLE_DEBUG true

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <locale>

/* Credits: Devwarlt */


/* --[[START]]-- dynamic stack definition */

void ThrowException(std::string exception, std::string message, bool safeExit, std::string name) {
	if (exception.empty())
		std::cout << "\n[Undefined Exception]:\n\t[Pilha " << name << "] " << message << "\n" << std::endl;
	else
		std::cout << "\n[" << exception << " Exception]:\n\t[Pilha " << name << "] " << message << "\n" << std::endl;
	
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

void Init(Stack * stack) {
	stack->Peek = NULL;
}

bool IsEmpty(Stack * stack) {
	return stack->Peek == NULL;
}

void Push(Stack * stack, char val, std::string name) {
	struct Item item;
	item.Value = val;
	item.Next = stack->Peek;
	stack->Peek = &item;
	
	if (ENABLE_DEBUG)
		std::cout << "[Push Event] > Adicionando o elemento " << val << " na pilha " << name << ".\n";
}

char Pop(Stack * stack, std::string name) {
	if (IsEmpty(stack)) {
		ThrowException("Stack Underflow", "A pilha está vazia!", false, name);
		return NULL;
	}
	
	char val = stack->Peek->Value;
	struct Item *item = stack->Peek;
	stack->Peek = stack->Peek->Next;
	
	//free(item); // release memory cache for specific pointer address
	
	if (ENABLE_DEBUG)
		std::cout << "[Pop Event] > Removendo o elemento " << val << " na pilha " << name << ".\n";

	return val;
}

/* --[[ END ]]-- dynamic stack definition */

bool IsEquals(Stack & a, Stack & b) {
	if (ENABLE_DEBUG && IsEmpty(&a)) {
		std::cout << "[Equals Event] > Parâmetro *a (Stack) é vazia!";
		return false;
	}
	
	if (ENABLE_DEBUG && IsEmpty(&b)) {
		std::cout << "[Equals Event] > Parâmetro *b (Stack) é vazia!";
		return false;
	}
	
	Stack ref1 = a, ref2 = b, ref3, ref4;
	
	/* maintain stored values */
	Init(&ref3);
	Init(&ref4);
	
	char output;
	bool result;
	
	do {
		if (IsEmpty(&ref1) && IsEmpty(&ref2)) {
			std::cout << "stacks are empty!" << std::endl;
			result = true;
			break;
		}
		
		char output1 = Pop(&ref1, "stack 1 ref");
		char output2 = Pop(&ref2, "stack 2 ref");
		
		Push(&ref3, output1, "stack 1 ref [record]");
		Push(&ref4, output2, "stack 2 ref [record]");
		
		if (output1 != output2) {
			std::cout << "output1 == output2 (breaking loop)" << std::endl;
			result = false;
			break;
		}
	} while (true);
	
	if (!IsEmpty(&ref3))
		do {
			char a_output = Pop(&ref3, "stack 1 ref [record]");
			Push(&ref1, a_output, "stack 1 ref [record val]");
		} while(!IsEmpty(&ref3));
		
	if (!IsEmpty(&ref4))
		do {
			char b_output = Pop(&ref4, "stack 2 ref [record]");
			Push(&ref2, b_output, "stack 2 ref [record val]");
		} while(!IsEmpty(&ref4));
	
	return result;
}

/*
	Code: Nádio Dib "Devwarlt"
	Reference: Zhihao Yuan
	
	Overview:
		Printf defines the most widely used syntax to format a text output.
		It exists in C, Perl, Python and even Java™, and is available from
		Qt to Boost.Format[1], but not C++ standard library. This proposal
		tries to define such an interface based on the printf function
		defined by C[2] for the C++ I/O streams library, with the error
		handling policy and the type safety considered.
	
	Syntax:
		The syntax from printf in C is preserved as much as possible.
		
	Example:
		std::cout << putf("The answer:%2$*1$d\n", 5, 42);  // same effect
		
	Source:
		"A printf-like Interface for the Streams Library (revision 1)",
		available at http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2013/n3716.html
*/
template <typename T, typename... Types> 
std::string putf(T format, Types... args) {
	char buffer[STD_FMT_BUFFER];
	std::sprintf(buffer, format, args...);
	std::string fmt_str;
	fmt_str.assign(buffer);
	return fmt_str;
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
		std::cout << "---\n";
	
	/* push values to s2 stack */
	Push(&s2, '1', "stack 2");
	Push(&s2, '2', "stack 2");
	Push(&s2, '3', "stack 2");
	
	if (ENABLE_DEBUG)
		std::cout << "---\n";
	
	/* push values to s3 stack */
	Push(&s3, '1', "stack 3");
	Push(&s3, '3', "stack 3");
	Push(&s3, '2', "stack 3");
	
	if (ENABLE_DEBUG)
		std::cout << "---\n";
	
	bool rs1 = IsEquals(s1, s2);
	std::cout << putf("---\ns1 == s2? %s", rs1 ? "true" : "false");
	
	/*std::cout << "\n---\n";
	
	bool rs2 = IsEquals(s1, s3);
	std::cout << "---\ns1 == s3? " << rs2 == 1 ? "true" : "false";*/
	
	std::exit(EXIT_SUCCESS);
}
