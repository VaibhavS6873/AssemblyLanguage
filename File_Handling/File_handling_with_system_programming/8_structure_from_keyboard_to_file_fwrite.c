#include<stdio.h>
#include<unistd.h>
#include<fcntl.h>

#define BUFFER_SIZE 512
int main()
{
	char chChar = 'Y';
	char err[] = "\nCant Open Source File\n";
	char ent1[] = "\n\nEnter name, roll no. and percentage:\n";
	char ent2[] = "\nAdd another record (Y/N)";
	char buffer[BUFFER_SIZE];
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	
	struct student s;
	char chTemp;
	
	int fd = open("student_structure_from_keyboard_to_file.txt",O_WRONLY|O_CREAT|O_TRUNC);
	
	if(-1 == fd)
	{
		write(STDOUT_FILENO, err, sizeof(err));
		return -1;
	}
	
	while(chChar == 'Y' || chChar == 'y')
	{
		write(STDOUT_FILENO, ent1, sizeof(ent1));
		scanf("%s %d %f",s.szName, &s.iRollNo, &s.fPerc);
		int len = sprintf(buffer,"%s %d %f\n",s.szName,s.iRollNo,s.fPerc); 
		write(fd, buffer, len);
		write(STDOUT_FILENO, ent2, sizeof(ent2));
		scanf("%c%c",&chTemp, &chChar);
	}
	
	close(fd);
	return 0;
}
