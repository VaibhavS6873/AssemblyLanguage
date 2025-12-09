#include<stdio.h>
#include<stdlib.h>

void fun(void);
extern int g_iNo;
int main(void)
{
	printf("In main, %d", g_iNo);
	fun();
	exit 0;
}
int g_iNo;
