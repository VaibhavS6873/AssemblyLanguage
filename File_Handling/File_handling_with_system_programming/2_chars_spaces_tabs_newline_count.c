#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>

#define BUFFER_SIZE 1024
int main(void)
{	
	char error[] = "\nCant Open File\n";
	int bytes_read;
	char buffer[BUFFER_SIZE];
	
	int iNoOfChars = 0;
	int iNoOfSpaces = 0;
	int iNoOfTabs = 0;
	int iNoOfLines = 0;
	
	int fd = open("chars_spaces_tabs_newlines_count.txt",O_RDONLY);
	
	if(-1 == fd)
	{
		write(STDOUT_FILENO,error,sizeof(error));
		return -1; 
	}
	
	while(1)
	{
		bytes_read = read(fd, buffer, BUFFER_SIZE);
		if(bytes_read == 0)
			break;
			
	
		for(int i = 0; i < bytes_read; i++)
		{
			iNoOfChars++;
			if(buffer[i] == ' ')
				iNoOfSpaces++;
			
			else if(buffer[i] == '\t')
				iNoOfTabs++;
			
			else if(buffer[i] == '\n')
				iNoOfLines++;
		}
	}
	
	close(fd);
	
	printf("\nNo of characters are %d\n",iNoOfChars);
	printf("No of spaces are %d\n",iNoOfSpaces);
	printf("No of tabs are %d\n", iNoOfTabs);
	printf("No of lines are %d\n", iNoOfLines);
	
	return 0;
}
