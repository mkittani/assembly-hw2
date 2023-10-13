#include <stdio.h>

int main() {
    int a, result;
    printf("Enter an integer: ");
    scanf("%d", &a);
    __asm__ (
        mov cx, [a]
        or bx,FFFFH
        or ax,FFFFH
        L1:
            mul bx
            inc bx
        loop L1
        // loop cx, loop_start
        mov [result], ax
    );
    printf("Factorial of %d is: %d\n", a, result);
    return 0;
}