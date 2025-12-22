#include<stdio.h>

int main()
{
	FILE *fp = NULL;

	
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	
	struct student s;
	
	fp = fopen("student_structure_from_file_to_screen.txt","w");
	
	if(NULL == fp)
	{
		printf("\nCant Open File\n");
		return -1;
	}
	
	while(fscanf(fp,"%s %d %f",s.szName, &s.iRollNo, &s.fPerc) != EOF)
	{
		printf("%s %d %f",s.szName, s.iRollNo, s.fPerc);
	}
	
	fclose(fp);
	fp = NULL;
	
	return 0;
}
