#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int arr[] = {10,20,30,40,50};
	int	*p[] = {arr, arr+1, arr+2, arr+3, arr+4};
	int	**ptr = p;
	
	printf("arr = %p \t *arr = %d \t &arr = %p\n", arr, *arr, &arr);
	printf("p = %p \t *p = %p \t **p = %d\n", p, *p, **p);
	printf("ptr = %p \t *ptr = %p \t **ptr = %d\n",ptr, *ptr, **ptr);
	
	*ptr++;
	printf("ptr-p = %d \t *ptr-arr = %d \t **ptr = %d\n", ptr-p, *ptr-arr, **ptr);
	
	*++ptr;
	printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
	
	++*ptr;
	printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n",ptr - p, *ptr - arr, **ptr);
	
	exit(0);
}
