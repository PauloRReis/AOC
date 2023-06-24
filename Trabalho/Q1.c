#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    int w = 10;
    int f = w;
    w = 0;

    while(f > 0){
        w += f;
        f--;
    }

    f = w;
    return 0;
}
