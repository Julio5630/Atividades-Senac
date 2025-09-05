// Aritmetica de Ponteiro
#include<stdio.h>
int main(){
    int array[5] = {1,2,3,4,5};
    int *ponteiro = array;
    printf("%d\n", *(ponteiro + 2));
    return 0;
}
