#include "locale.h"
#include "stdarg.h"
#include "stdbool.h"
#include "stdio.h"
#include "stdlib.h"

/*
    04 de outubro de 2019

    Lógica Computacional - Prof. Welton
    Departamento de T.I., UniProjeção (Taguatinga, Campus I)

    Engenharia de Software (2º semestre)
    Autor: Nádio Dib
    
    Referências bibliográficas:
    	[1]. "Program for Decimal to Binary Conversion", disponível em https://www.geeksforgeeks.org/program-decimal-binary-conversion/ .
		[2]. "Left Shift and Right Shift Operators (>> and <<)", disponível em https://docs.microsoft.com/pt-br/cpp/cpp/left-shift-and-right-shift-operators-input-and-output?view=vs-2019 .
		[3]. "As 10 conversões numéricas mais utilizadas na computação", disponível em https://dicasdeprogramacao.com.br/as-10-conversoes-numericas-mais-utilizadas-na-computacao/ .
		[4]. "Find if variable is divisible by 2", disponível em https://stackoverflow.com/a/2821016 .
		[5]. "C - Variable Arguments", disponível em https://www.tutorialspoint.com/cprogramming/c_variable_arguments.htm .
		[6]. "free all arguments in variadic function - c", disponível em https://stackoverflow.com/a/14746148 .
		[7]. "Entrada/Saída com Streams", disponível em https://www.inf.pucrs.br/~pinho/PRGSWB/Streams/streams.html .
		[8]. "How to convert a string to integer in C?", disponível em https://stackoverflow.com/a/7021750 .
		[9]. "strtol, strtoll", disponível em https://en.cppreference.com/w/c/string/byte/strtol .
		[10]. "itoa", disponível em http://www.cplusplus.com/reference/cstdlib/itoa/ .
*/

/// Inicialização do cabeçalho do programa.
void showHeader()
{
    printf("--------------------------------------------\n");
    printf("-        Conversão de Base Numéricas       -\n");
    printf("--------------------------------------------\n");
    printf("\n");
    printf("Opções:\n");
    printf("\t[1]. conversão decimal para binário.\n");
    printf("\t[2]. conversão decimal para octagonal.\n");
    printf("\t[3]. conversão decimal para hexadecimal.\n\n");
    printf("\t[0]. sair do programa.\n\n");
    printf("Opção > ");
}

/// Sobrescreve uma variável através de seu endereço de memória e
/// atribui a ela um valor de entrade pelo usuário.
void getValue(int *value)
{
    printf("\nValor em decimal > ");

    // sobrescrita da variável em seu endereço de memória
    scanf("%i", *&value);
}

/// Continua um método 'void' que não possui nenhum argumento de
/// entrade e libera espaço da memória de argumentos já realocados.
void continueAndFree(void (*func)(), void *args, ...)
{
    printf("\n\n");
    system("pause");
    system("cls");

    va_list vargs;

    // alocação de endereços de memória dos argumentos
    va_start(vargs, &args);

    // liberação de espaço alocado de memória dos argumentos
    va_end(vargs);

    // invocação do método de continuação
    (*func)();
}

/// Inicialização do menu do programa. Contém até 3 opções de
/// conversão de base (binária, octagonal e hexadecimal) para
/// base do tipo decimal.
void displayMenu()
{
    int option, value;
    char *base, result[32];

    // inicialização do cabeçalho
    showHeader();

    // obtenção das opções através do usuário
    scanf("%i", &option);

    // seleção das possíveis opções
    switch (option)
    {
        // efetua a saída do programa com retorno EXIT_SUCCESS
    case 0:
        exit(EXIT_SUCCESS);
        break;

        // opção para conversão de base binária
    case 1:
        getValue(&value);
        itoa(value, result, 2);
        base = "binário";
        break;

        // opção para conversão de base octagonal
    case 2:
        getValue(&value);
        itoa(value, result, 8);
        base = "octagonal";
        break;

        // opção para conversão de base hexadecimal
    case 3:
        getValue(&value);
        itoa(value, result, 16);
        base = "hexadecimal";
        break;

        // opção padrão em caso de opção inválida
    default:
        printf("\nOpção inválida!");

        // liberação de espaço de memória já alocado pelo programa
        continueAndFree(displayMenu, &option, &result, &base, &value);
        break;
    }

    printf("\n[Resultado] Conversão de base decimal para base %s: \"%s\".", base, result);

    // liberação de espaço de memória já alocado pelo programa
    continueAndFree(displayMenu, &option, &result, &base, &value);
}

int main(void)
{
    // configuração de codificação UTF-8
    setlocale(LC_ALL, "Portuguese");

    // invoca o método para o menu de opções
    displayMenu();

    // em caso de invalidação dentro do método de menu, o programa retorna EXIT_FAILURE
    return EXIT_FAILURE;
}