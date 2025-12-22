#include<stdio.h>
#include<stdarg.h>

int myPrintf(const char *, ...);

int main(void)
{
	int iRet;
	
	iRet = myprintf("Hello\n");
	myprintf("printf returned %d\n", iRet);
	
	myprintf("%d\n",10);
	myprintf("%d\t%c\n",10,'A');
	myprintf("%c\t%d\n", 'A', 10);
	myprintf("%c\t%d\t%f\t%lf\n", 'A', 10, 57.33f, 69.33);
	
	iRet = Addition(2, 10, 20);
	printf("Answer is %d\n", iRet);
	
	iRet = Addition(3, 10, 20, 30);
	printf("Answer is %d\n", iRet);
	
	iRet = Addition(4, 10, 20, 30,40);
	printf("Answer is %d\n", iRet);
	
	return 0; //exit(0)
}

int myprintf(char* pszFormat, ...)
{
	int iRet;
	va_list pArg = NULL;  //char* pArg
	
	va_start(pArg, pszFormat);
	
	iRet = vprintf(pszFormat,pArg);
	
	va_end(pArg);
	
	return iRet;
}

int Addition(int iTotalParam, ...)
{
	int iAns;
	int iCounter;
	va_list pArg = NULL;
	
	va_start(pArg,iTotalParam);
	
	for(iCounter = 0, iAns = 0; iCounter < iTotalParam; iCounter++)
		iAns = iAns + va_arg(pArg, int);
		
	va_end(pArg);
	return iAns;
}

