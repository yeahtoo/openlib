#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>

int main(int argc, char *argv[])
{
    int i;
    struct timeval tv;
    long long int t1, t2;
    double second;

    if (argc <= 1)
    {
        printf("\nexample: %s [cmd...]\n\n", argv[0]);
        return -1;
    }

    for (i = 1; i < argc; i++)
    {
        gettimeofday(&tv, NULL);
        t1 = tv.tv_sec * 1000 + tv.tv_usec / 1000;
        system(argv[i]);
        gettimeofday(&tv, NULL);
        t2 = tv.tv_sec * 1000 + tv.tv_usec / 1000;
        second = (double)(t2 - t1) / 1000;
        printf("\ncmd: %s\ncost time: %.3fs\n\n", argv[i], second);
    }
    return 0;
}
