#define LENGTH 5

#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"
#include "locale.h"
#include "Windows.h"

int main(void)
{
    setlocale(LC_ALL, "Portuguese");

    int primeiro = 0,
        segundo = 0,
        terceiro = 0,
        entrada = 0,
        contador = 0;

    bool inicializado = false;

    if (LENGTH <= 0)
    {
        printf("O tamanho declarado não é permitido! Somente valores maiores que zero.");
        return EXIT_FAILURE;
    }

    printf("Algoritmo para encontrar os três maiores números.\n\n");

    while (contador < LENGTH)
    {
        printf("[%i de %i] Digite um número: ", ++contador, LENGTH);
        scanf("%i", &entrada);

        if (!inicializado)
        {
            primeiro = segundo = terceiro = entrada;
            inicializado = true;

            continue;
        }

        if (primeiro < entrada)
        {
            int _primeiro = primeiro,
                _segundo = segundo;

            primeiro = entrada;
            segundo = _primeiro;
            terceiro = _segundo;

            continue;
        }

        if (segundo < entrada & segundo < primeiro)
        {
            int _segundo = segundo;

            segundo = entrada;
            terceiro = _segundo;

            continue;
        }

        if (terceiro < entrada & terceiro < segundo)
            terceiro = entrada;
    }

    printf("\n--[ RESULTADO ]--\n\nMaiores números (total de '%i' número%c):\n\t- 1º número: %i\n\t- 2º número: %i\n\t- 3º número: %i",
           LENGTH, LENGTH > 1 ? 's' : NULL, primeiro, segundo, terceiro);

    return EXIT_SUCCESS;
}