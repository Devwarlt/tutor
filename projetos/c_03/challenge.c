#include "locale.h"
#include "stdarg.h"
#include "stdio.h"
#include "stdlib.h"

/*
    04 de outubro de 2019

    Lógica Computacional - Prof. Welton
    Departamento de T.I., UniProjeção (Taguatinga, Campus I)

    Engenharia de Software (2º semestre)
    Autor: Nádio Dib
*/

void showHeader()
{
    printf("--------------------------------------------\n");
    printf("-              Desafio Prático             -\n");
    printf("--------------------------------------------\n");
    printf("\n");
    printf("\t[0]. sair do programa.\n\n");
    printf("Entre com o valor para realizar a contagem: ");
}

void getValue(int *value)
{
    scanf("%i", *&value);
}

void continueAndFree(void (*func)(), void *args, ...)
{
    printf("\n\n");
    system("pause");
    system("cls");

    va_list vargs;
    va_start(vargs, &args);
    va_end(vargs);

    (*func)();
}

void counter()
{
    int value, amount;
    char binary[32], octal[32], hexadecimal[32];

    showHeader();
    getValue(&value);

    if (value == 0)
        exit(EXIT_SUCCESS);
    else if (value > 255)
    {
        printf("\nValor inválido!");

        continueAndFree(counter, &value, &binary, &octal, &hexadecimal);
    }
    else
    {
        printf("\n\n---[ Resultado ]---\n\n\n");

        for (amount = 0; amount <= value; amount++)
        {
            itoa(amount, binary, 2);
            itoa(amount, octal, 8);
            itoa(amount, hexadecimal, 16);

            printf("base 2: %s\t\tbase 8: %s\t\tbase 10: %i\t\tbase 16: %s\n", binary, octal, amount, hexadecimal);
        }

        printf("\nLegenda:\n");
        printf("\tbase 2: binário\n");
        printf("\tbase 8: octagonal\n");
        printf("\tbase 10: decimal\n");
        printf("\tbase 16: hexadecimal\n");
    }

    continueAndFree(counter, &value, &binary, &octal, &hexadecimal);
}

int main(void)
{
    setlocale(LC_ALL, "Portuguese");

    counter();

    return EXIT_SUCCESS;
}