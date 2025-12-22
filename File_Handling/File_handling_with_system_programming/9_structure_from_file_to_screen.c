#include<stdio.h>
#include<unistd.h>
#include<fcntl.h>

#define BUFFER_SIZE 1024
int main()
{
	char err[] = "\nCant Open File\n";
	int bytes_read;
	char buffer[BUFFER_SIZE];
	
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	
	struct student s;
	
	int fd = open("student_structure_from_file_to_screen.txt",O_RDONLY);
	
	if(-1 == fd)
	{
		write(STDOUT_FILENO,err,sizeof(err));
		return -1;
	}
	
	while(1)
	{
		bytes_read = read(fd,buffer,BUFFER_SIZE);
		if(bytes_read == 0)
			break;
			
		write(STDOUT_FILENO,buffer,bytes_read);
	}
	
	close(fd);
	return 0;
}
