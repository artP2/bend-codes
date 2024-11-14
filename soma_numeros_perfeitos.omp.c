#include <stdio.h>
#include <omp.h>

int eh_perfeito(int num) {
    int soma = 0;
    
    for (int i = 1; i < num; i++) {
        if (num % i == 0) {
            soma += i;
        }
    }
    
    return soma == num;
}

int main() {
    int limite_superior;
    
    scanf("%d", &limite_superior);

    int qtd_threads = 5;
    if (limite_superior > 4) {
        if (limite_superior > 10) {
            qtd_threads = 10;
        } else {
            qtd_threads = limite_superior;
        }
    }
    
    omp_set_num_threads(qtd_threads);
    
    int soma = 0;

    #pragma omp parallel for reduction(+:soma)
    for (int i = 1; i <= limite_superior; i++) {
        if (eh_perfeito(i)) {
            soma += i;
        }
    }

    printf("%d\n", soma);

    return 0;
}

