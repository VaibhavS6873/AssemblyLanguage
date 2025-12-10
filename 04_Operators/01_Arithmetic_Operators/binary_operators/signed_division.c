#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	int iNumerator;
	int iDenominator;
	int iQuotient;
	int iRemainder;
	
	printf("Enter numerator:\t");
	scanf("%d",&iNumerator);
	
	printf("Enter denominator:\t");
	scanf("%d",&iDenominator);
	
	iQuotient = iNumerator / iDenominator;
	iRemainder = iNumerator % iDenominator;
	
	printf("Quotient is = %d\n", iQuotient);
	printf("Remainder is = %d", iRemainder);
	exit(0);
}
